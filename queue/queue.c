// The queue module

// must have includes
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>

// bus
#include <linux/i2c.h>

// kernel utilities
#include <linux/timer.h>                // timer irqs
#include <linux/interrupt.h>            /* For IRQ */
#include <linux/workqueue.h>
#include <linux/moduleparam.h>

static int irq_test = 0;
module_param(irq_test, int, S_IRUGO | S_IWUSR);
MODULE_PARM_DESC(irq_test, "Testing purposes for irq");

//static unsigned int irq;
static struct timer_list queue_timer;
static struct i2c_client * queue_tsl2561;

#define TIMER_PERIOD (5 * 1000)

#define CMD_CNTR        0x80
#define CMD_TIMING      0x81
#define CMD_IRQ_LOW     0xD2
#define CMD_IRQ_HIGH    0xD4
#define CMD_IRQ_CTRL    0x86
#define CMD_FW          0x8A
#define CMD_CH0         0xAC
#define CMD_CH1         0xAE
#define CMD_IRQ_CLEAR   0xC6

static struct work_struct work;

static irq_handler_t queue_irq_handler(unsigned int irq, void *dev_id, struct pt_regs *regs)
{
  pr_info("queue: irq!\n");

  return IRQ_HANDLED;
}

// reading one of sensors
// command is always single u8, value is always single u16
static int tsl2561_read(struct i2c_client * client, u8 * command, void * value, u8 count)
{
  struct i2c_msg msg[2];

  // first write register (command)
  msg[0].addr = client->addr;
  msg[0].flags = 0;
  msg[0].len = sizeof(u8);
  msg[0].buf = command;

  // then read the rdesult
  msg[1].addr = client->addr;
  msg[1].flags = I2C_M_RD;
  msg[1].len = count;
  msg[1].buf = value;

  return i2c_transfer(client->adapter, msg, 2);
}

static int tsl2561_write(struct i2c_client * client, u8 * command, void * value, u8 count)
{
  struct i2c_msg msg[2];

  // first write register (command)
  msg[0].addr = client->addr;
  msg[0].flags = 0;
  msg[0].len = sizeof(u8);
  msg[0].buf = command;

  // then write the command
  msg[1].addr = client->addr;
  msg[1].flags = 0;
  msg[1].len = count;
  msg[1].buf = value;

  return i2c_transfer(client->adapter, msg, 2);
}

// read all of sensor values
static void read_tsl2561_values(struct work_struct * work_read)
{
  u8 command = CMD_IRQ_CTRL;
  u8 reg = 0x30;
  if (irq_test) {
    if (tsl2561_write(queue_tsl2561, &command, &reg, sizeof(reg)) < 0) {
      pr_err("queue: not able to set irq line manually");
    }
    else {
      pr_info("queue: irq line set manually");
    }
  }

  // read tsl value
  command = CMD_CH0;
  u16 value = 0x00;
  if (tsl2561_read(queue_tsl2561, &command, &value, sizeof(value)) < 0)
  {
    pr_err("queue: unable to read tsl2561 data");
  }
  else
  {
    pr_info("queue: tsl2561 value = 0x%x", value);
  }

  // reset the interrupt (any value outside of range)
  command = CMD_IRQ_CLEAR;
  reg = 0x11;
  if (tsl2561_write(queue_tsl2561, &command, &reg, sizeof(reg)) < 0)
  {
    pr_err("queue: unable to reset tsl2561 irq");
  }
  else
  {
    pr_info("queue: tsl2561 irq was reset");
  }
}

// callback for the timer
// LDDD, pg. 65:
// timers represent atomic context
// meaning that no mutex can be acquired as it includes context switch
// should use deferring mechanism and schedule work task
// (not softIRQ or tasklet as they are also atomic) from timer
static void queue_timer_callback(unsigned long data)
{
  pr_info("%s called (%ld).\n", __FUNCTION__, jiffies);

  int retval = mod_timer(&queue_timer, jiffies + msecs_to_jiffies(TIMER_PERIOD));
  if (retval)
    pr_err("%s: Could not re-trigger queue timer!\n", __FUNCTION__);

  // schedule a work to be performed
  schedule_work(&work);

  return;
}

static void init_tsl2561()
{
  u8 command = CMD_CNTR;
  u8 value = 0x03;

  if (tsl2561_write(queue_tsl2561, &command, &value, sizeof(value)) < 0) {
    pr_err("queue: can't power on the sensor!");
  }
  else {
    pr_info("queue: sensor powered on!");
  }

  command = CMD_TIMING;
  value = 0x02;
  if (tsl2561_write(queue_tsl2561, &command, &value, sizeof(value)) < 0) {
    pr_err("queue: can't set timing register!");
  }
  else {
    pr_info("queue: timing register set to 0x%x!", value);
  }

  command = CMD_IRQ_LOW;
  u16 irq_th = 0x10;
  if (tsl2561_write(queue_tsl2561, &command, &irq_th, sizeof(irq_th)) < 0) {
    pr_err("queue: can't set irq low register!");
  }
  else {
    pr_info("queue: irq low register set to 0x%x!", irq_th);
  }

  command = CMD_IRQ_HIGH;
  irq_th = 0x100;
  if (tsl2561_write(queue_tsl2561, &command, &irq_th, sizeof(irq_th)) < 0) {
    pr_err("queue: can't set irq high register!");
  }
  else {
    pr_info("queue: irq high register set to 0x%x!", irq_th);
  }

  command = CMD_IRQ_CTRL;
  value = 0x11;
  if (tsl2561_write(queue_tsl2561, &command, &value, sizeof(value)) < 0) {
    pr_err("queue: can't set irq control register!");
  }
  else {
    pr_info("queue: irq control register set to 0x%x!", value);
  }
}

// have a look at:
// Documentation/gpio/board.txt
static int queue_probe(struct i2c_client * client, const struct i2c_device_id * id)
{
  int retval;
  pr_info("queue: device probe called!\n");

  // save pointer for later
  queue_tsl2561 = client;

  pr_info("queue: name = %s", id->name);
  pr_info("queue: addr = 0x%x", client->addr);

  pr_info("queue: try communicating from probe!");

  // init the single sensor
  init_tsl2561();

  // initialize work queue
  INIT_WORK(&work, read_tsl2561_values);

  // configure interrupt
  // interrupt registered, check: cat /proc/interrupts
//  irq = gpiod_to_irq(queue_in);
//  retval = request_threaded_irq(irq, NULL, queue_irq_handler, IRQF_TRIGGER_HIGH | IRQF_ONESHOT, "queue-sensor", NULL);
//  if (retval)
//    pr_err("%s: Unable to allocate interrupt!\n", __FUNCTION__);

  // setting up a periodic timer
  setup_timer(&queue_timer, queue_timer_callback, NULL);
  retval = mod_timer(&queue_timer, jiffies + msecs_to_jiffies(TIMER_PERIOD));
  if (retval)
    pr_err("%s: Could not set queue timer period!\n", __FUNCTION__);

  pr_info("queue: device probed!\n");
  return 0;
}

static void shutdown_tsl2561(struct i2c_client * client)
{
  u8 command = CMD_CNTR;
  u8 value = 0x00;

  if (tsl2561_write(client, &command, &value, sizeof(value)) < 0) {
    pr_err("queue: can't power down the sensor!");
  }
  else {
    pr_info("queue: sensor powered down!");
  }
}

static void queue_remove(struct platform_device *pdev)
{
  pr_info("queue: device remove called!\n");

  // release irq
//  free_irq(irq, NULL);

  // free timers
  del_timer(&queue_timer);

  // turn off the sensor
  shutdown_tsl2561(queue_tsl2561);

  pr_info("queue: remove\n");
}

static const struct of_device_id queue_of_ids[] = {
    {.compatible = "queue"},
    {}
};

// LDDD: pg. 175-176 (need both IDs for matching: of and i2c)
MODULE_DEVICE_TABLE(of, queue_of_ids);

static const struct i2c_device_id queue_i2c_ids[] = {
    {.name = "queue"},
    { /* sentinel */}
};

// LDDD: pg. 169, inform the kernel, register driver IDs with platform core
// LDDD: pg. 175-176 (need both IDs for matching: of and i2c)
MODULE_DEVICE_TABLE(i2c, queue_i2c_ids);

// LDDD: pg. 175-176 (need both IDs for matching: of and i2c)
static struct i2c_driver queue_drv = {
    .probe = queue_probe,
    .remove = queue_remove,
    .driver = {
             .name = "queue_driver",
             .of_match_table = of_match_ptr(queue_of_ids),
             .owner = THIS_MODULE, },
    .id_table = queue_i2c_ids,
};

// init & exit are not registered/used in this module as module_i2c_driver is used for registration with kernel
// init must have return type
// __init is mandatory when built into kernel to tell kernel to free memory after init is complete
int __init queue_init()
{
  pr_info("queue: Hello world! built( %s %s)\n", __DATE__, __TIME__);

  // LDDD: platform drivers register/unregister, pg 118-122
  // register platform driver with kernel
  i2c_add_driver(&queue_drv);

  return 0;
}

// exit doesn't need return code (optional)
// __exit mandatory when built into kernel, to tell kernel not to compile it as it will always be present in memory
void __exit queue_exit()
{
  pr_info("queue: bye, bye\n");

  // LDDD: platform drivers register/unregister, pg 118-122
  // unregister the platform driver
  i2c_del_driver(&queue_drv);

  return;
}

/* module_platform_driver() & other functions from that family (e.g. i2c, spi, etc.):
 * Helper macro for drivers that don't do
 * anything special in module init/exit.  This eliminates a lot of
 * boilerplate.  Each module may only use this macro once, and
 * calling it replaces module_init() and module_exit()
 */
// additionally it will register driver with kernel
module_i2c_driver(queue_drv);

//module_init(queue_init);   // tell kernel that this is module init function
//module_exit(queue_exit);   // tell kernel that this is module exit function

MODULE_AUTHOR("ilukic");
MODULE_DESCRIPTION("Example");
MODULE_LICENSE("GPL");      // allowed usage of GPL internal kernel exports
MODULE_VERSION("0.1");
