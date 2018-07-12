// The traditional Hello World module
// must have includes
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>

// init must have retutn type
// __init is mandatory when built into kernel to tell kernel to free memory after init is complete
int __init simple_init()
{
	printk("simple: Hello world! built( %s %s)\n", __DATE__, __TIME__);
	return 0;
}

// exit doesn't need return code (optional)
// __exit mandatory when built into kernel, to tell kernel not to compile it as it will always be present in memory
void __exit simple_exit()
{
	printk("simple: bye, bye\n");
}

module_init(simple_init);   // tell kernel that this is module init function
module_exit(simple_exit);   // tell kernel that this is module exit function

MODULE_AUTHOR("ilukic");
MODULE_DESCRIPTION("Example");
MODULE_LICENSE("GPL");      // allowed usage of GPL internal kernel exports
MODULE_VERSION("0.1");
