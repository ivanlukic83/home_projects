// The moisture module
// must have includes
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>

#include <linux/platform_device.h>      /* For platform devices */
#include <linux/gpio/consumer.h>        /* For GPIO Descriptor (new descriptor-based interface) */
#include <linux/interrupt.h>            /* For IRQ */
#include <linux/of.h>                   /* For DT*/

#include <linux/timer.h>                // timer irqs

static struct gpio_desc *moisture_out, *moisture_in;
static unsigned int irq;
static struct pinctrl *pinctrl_node;
static struct pinctrl_state *pinctrl_state;
static struct timer_list moisture_timer_off;
static struct timer_list moisture_timer_on;

#define TIMER_PERIOD_OFF (59*1000)
#define TIMER_PERIOD_ON (1*1000)

static irq_handler_t moisture_irq_handler(unsigned int irq, void *dev_id, struct pt_regs *regs)
{
  pr_info("moisture: irq!\n");

  // irq arrived, there is enough water, so set out pin to 1, and stop further irqs
  gpiod_set_value(moisture_out, 0);

  return IRQ_HANDLED;
}

// callback of "OFF" timer (off-time expired), used to trigger "ON" timer
void moisture_timer_callback_off(unsigned long data)
{
  pr_info("%s called (%ld).\n", __FUNCTION__, jiffies);

  // set out pin (on)
  gpiod_set_value(moisture_out, 1);

  int retval = mod_timer(&moisture_timer_on, jiffies + msecs_to_jiffies(TIMER_PERIOD_ON));
  if (retval)
    pr_err("%s: Could not re-trigger moisture timer!\n", __FUNCTION__);

  return;
}

// callback of "ON" timer (on-time expired), used to trigger "OFF" timer
void moisture_timer_callback_on(unsigned long data)
{
  pr_info("%s called (%ld).\n", __FUNCTION__, jiffies);

  // set out pin (off)
  gpiod_set_value(moisture_out, 0);

  int retval = mod_timer(&moisture_timer_off, jiffies + msecs_to_jiffies(TIMER_PERIOD_OFF));
  if (retval)
    pr_err("%s: Could not re-trigger moisture timer!\n", __FUNCTION__);

  return;
}

// have a look at:
// Documentation/gpio/board.txt
static int moisture_probe(struct platform_device *pdev)
{
  int retval;
  struct device *dev = &pdev->dev;

  pr_info("moisture: device probe called!\n");
  // select and apply pin configuration for device
  // try using managed version instead
  // static struct pinctrl * pinctrl_get_select_default(struct device *dev) // pg. 366
  // e.g.
  //pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
  //if (IS_ERR(pinctrl))
  //	dev_warn(&pdev->dev, "pins are not configured\n");
  // see samsung-punctrl.txt as example ln. 319 (Example 4: Set up the default pin state for uart controller.)
  pinctrl_node = pinctrl_get(dev);
  if (IS_ERR(pinctrl_node))
    return pinctrl_node;

  pinctrl_state = pinctrl_lookup_state(pinctrl_node, "default");
  if (IS_ERR(pinctrl_state)) {
    devm_pinctrl_put(pinctrl_node);
    return ERR_PTR(PTR_ERR(pinctrl_state));
  }

  retval = pinctrl_select_state(pinctrl_node, pinctrl_state);
  if (retval < 0) {
    devm_pinctrl_put(pinctrl_node);
    return ERR_PTR(retval);
  }

  /*
   * We use gpiod_get/gpiod_get_index() along with the flags
   * in order to configure the GPIO direction and an initial
   * value in a single function call.
   *
   * One could have used:
   *  red = gpiod_get_index(dev, "led", 0);
   *  gpiod_direction_output(red, 0);
   */
  moisture_out = gpiod_get_index(dev, "moisture", 0, GPIOD_OUT_HIGH);
  moisture_in = gpiod_get_index(dev, "moisture", 1, GPIOD_IN);

  // sysfs exports
  // will be exported under /sys/class/gpio/gpio30 (gpio0, pin 30, P9_11)
  if (gpiod_export(moisture_out, false))
    pr_err("moisture: Can't export moisture_out!\n");
  else {
    // try creating link
    // will be created under: /sys/devices/platform/moisture/moisture_out
    if (gpiod_export_link(dev, "moisture_out", moisture_out))
      pr_err("moisture: Can't create link for moisture_out!");
  }

  // will be exported under /sys/class/gpio/gpio31 (gpio0, pin 31, P9_13)
  if (gpiod_export(moisture_in, false))
    pr_err("moisture: Can't export moisture_in!");
  else {
    // try creating link
    // will be created under: /sys/devices/platform/moisture/moisture_in
    if (gpiod_export_link(dev, "moisture_in", moisture_in))
      pr_err("moisture: Can't create link for moisture_in!");
  }

  // setting initial value for out pin
  gpiod_set_value_cansleep(moisture_out, 0);

  // configure interrupt
  // interrupt registered, check: cat /proc/interrupts
  irq = gpiod_to_irq(moisture_in);
  retval = request_threaded_irq(irq, NULL, moisture_irq_handler, IRQF_TRIGGER_HIGH | IRQF_ONESHOT, "moisture-sensor", NULL);
  if (retval)
    pr_err("%s: Unable to allocate interrupt!\n", __FUNCTION__);

  // setting up a periodic timer
  setup_timer(&moisture_timer_off, moisture_timer_callback_off, 0);
  setup_timer(&moisture_timer_on, moisture_timer_callback_on, 0);
  retval = mod_timer(&moisture_timer_off, jiffies + msecs_to_jiffies(TIMER_PERIOD_OFF));
  if (retval)
    pr_err("%s: Could not set moisture timer period!\n", __FUNCTION__);

  pr_info("moisture: device probed!\n");
  return 0;
}

static void moisture_remove(struct platform_device *pdev)
{
  pr_info("moisture: device remove called!\n");

  // release irq
  free_irq(irq, NULL);

  // free timers
  del_timer(&moisture_timer_off);
  del_timer(&moisture_timer_on);

  // free gpio descriptors
  gpiod_put(moisture_out);
  gpiod_put(moisture_in);

    // release pinctrl
  if (!IS_ERR(pinctrl_node))
    devm_pinctrl_put(pinctrl_node);

  pr_info("moisture: remove\n");
}

static const struct of_device_id moisture_gpiod_dt_ids[] = {
    { .compatible = "moisture", },
    { /* sentinel */}
};

// LDDD: pg 152-154, inform the kernel, register driver IDs with platform core
MODULE_DEVICE_TABLE(of, moisture_gpiod_dt_ids);

static struct platform_driver moisture_drv = {
    .probe = moisture_probe,
    .remove = moisture_remove,
    .driver = {
             .name = "moisture_driver",
             .of_match_table = of_match_ptr(moisture_gpiod_dt_ids),
             .owner = THIS_MODULE, },
};

// init must have return type
// __init is mandatory when built into kernel to tell kernel to free memory after init is complete
int __init moisture_init()
{
  pr_info("moisture: Hello world! built( %s %s)\n", __DATE__, __TIME__);

  // LDDD: platform drivers register/unregister, pg 118-122
  // register platform driver with kernel
  platform_driver_register(&moisture_drv);

  return 0;
}

// exit doesn't need return code (optional)
// __exit mandatory when built into kernel, to tell kernel not to compile it as it will always be present in memory
void __exit moisture_exit()
{
  pr_info("moisture: bye, bye\n");

  // LDDD: platform drivers register/unregister, pg 118-122
  // unregister the platform driver
  platform_driver_unregister(&moisture_drv);

  return;
}

/* module_platform_driver() - Helper macro for drivers that don't do
 * anything special in module init/exit.  This eliminates a lot of
 * boilerplate.  Each module may only use this macro once, and
 * calling it replaces module_init() and module_exit()
 */
// additionally it will register driver with kernel
module_platform_driver(moisture_drv);

//module_init(moisture_init);   // tell kernel that this is module init function
//module_exit(moisture_exit);   // tell kernel that this is module exit function

MODULE_AUTHOR("ilukic");
MODULE_DESCRIPTION("Example");
MODULE_LICENSE("GPL");      // allowed usage of GPL internal kernel exports
MODULE_VERSION("0.1");
