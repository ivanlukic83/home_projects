cmd_/home/ilukic/projects/modules/simple/src/simple.mod.o := arm-poky-linux-gnueabi-gcc -Wp,-MD,/home/ilukic/projects/modules/simple/src/.simple.mod.o.d  -nostdinc -isystem /opt/poky/2.2.1/sysroots/x86_64-pokysdk-linux/usr/lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/6.2.0/include -I/home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include -I./arch/arm/include/generated/uapi -I./arch/arm/include/generated  -I/home/ilukic/projects/yocto/kernel-yocto/kernel-source/include -I./include -I/home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/uapi -I/home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi -I./include/generated/uapi -include /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/kconfig.h -I/home/ilukic/projects/yocto/kernel-yocto/kernel-source//home/ilukic/projects/modules/simple -I/home/ilukic/projects/modules/simple -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -Wno-maybe-uninitialized -Wno-frame-address -Os --param=allow-store-data-races=0 -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -g -pg -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -DCC_HAVE_ASM_GOTO --sysroot=/opt/poky/2.2.1/sysroots/cortexa8hf-neon-poky-linux-gnueabi -w  -DKBUILD_BASENAME='"simple.mod"'  -DKBUILD_MODNAME='"simple"' -DMODULE  -c -o /home/ilukic/projects/modules/simple/src/simple.mod.o /home/ilukic/projects/modules/simple/src/simple.mod.c

source_/home/ilukic/projects/modules/simple/src/simple.mod.o := /home/ilukic/projects/modules/simple/src/simple.mod.c

deps_/home/ilukic/projects/modules/simple/src/simple.mod.o := \
    $(wildcard include/config/module/unload.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/module.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/debug/set/module/ronx.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/types.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/types.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/int-ll64.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/asm-generic/int-ll64.h \
  arch/arm/include/generated/asm/bitsperlong.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/bitsperlong.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/asm-generic/bitsperlong.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/posix_types.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/stddef.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/stddef.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/kasan.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/gcov/kernel.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/uapi/asm/posix_types.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/asm-generic/posix_types.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
    $(wildcard include/config/page/poisoning/zero.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/const.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/panic/timeout.h) \
  /opt/poky/2.2.1/sysroots/x86_64-pokysdk-linux/usr/lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/6.2.0/include/stdarg.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/linkage.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/stringify.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/linkage.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/bitops.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/bitops.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/typecheck.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/irqflags.h \
    $(wildcard include/config/cpu/v7m.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/uapi/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/hwcap.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/uapi/asm/hwcap.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/irqflags.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/barrier.h \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arm/heavy/mb.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/barrier.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/bitops/non-atomic.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/bitops/fls64.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/bitops/sched.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/bitops/hweight.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/bitops/arch_hweight.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/bitops/const_hweight.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/bitops/lock.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/bitops/le.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/uapi/asm/byteorder.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/byteorder/little_endian.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/byteorder/little_endian.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/swab.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/swab.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/swab.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/uapi/asm/swab.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/byteorder/generic.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk/nmi.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/init.h \
    $(wildcard include/config/broken/rodata.h) \
    $(wildcard include/config/debug/rodata.h) \
    $(wildcard include/config/lto.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/kern_levels.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/kernel.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/sysinfo.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/dynamic_debug.h \
    $(wildcard include/config/jump/label.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/div64.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/compiler.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/div64.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/stat.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/uapi/asm/stat.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/stat.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/seqlock.h \
    $(wildcard include/config/debug/lock/alloc.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/preempt.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  arch/arm/include/generated/asm/preempt.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/preempt.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/debug/stack/usage.h) \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/bug.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/bug.h \
    $(wildcard include/config/debug/bugverbose.h) \
    $(wildcard include/config/arm/lpae.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/opcodes.h \
    $(wildcard include/config/cpu/endian/be32.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/crunch.h) \
    $(wildcard include/config/arm/thumbee.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/kuser/helpers.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/glue.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/pgtable-2level-types.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/memory.h \
    $(wildcard include/config/need/mach/memory/h.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/have/tcm.h) \
    $(wildcard include/config/arm/patch/phys/virt.h) \
    $(wildcard include/config/phys/offset.h) \
    $(wildcard include/config/xip/kernel.h) \
    $(wildcard include/config/xip/phys/addr.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/sizes.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/pfn.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/getorder.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/bottom_half.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/spinlock_types.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/spinlock_types_up.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/rwlock_types.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/spinlock_up.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/processor.h \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/arm/errata/754327.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/hw_breakpoint.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/rwlock.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/spinlock_api_up.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/atomic.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/prefetch.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/cmpxchg.h \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/v6.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/cmpxchg-local.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/atomic-long.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/time64.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/time.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/highuid.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/kmod.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/gfp.h \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/cma.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/virtual.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/zsmalloc.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/wait.h \
  arch/arm/include/generated/asm/current.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/current.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/wait.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/nodemask.h \
    $(wildcard include/config/movable/node.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/bitmap.h \
    $(wildcard include/config/s390.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/string.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/string.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/page-flags-layout.h \
  include/generated/bounds.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/memory_hotplug.h \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/notifier.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/errno.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/errno.h \
  arch/arm/include/generated/asm/errno.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/asm-generic/errno.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/asm-generic/errno-base.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/mutex/spin/on/owner.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/osq_lock.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/err.h \
  arch/arm/include/generated/asm/rwsem.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/rwsem.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/srcu.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/rcupdate.h \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/rcu/trace.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/rcu/nocb/cpu/all.h) \
    $(wildcard include/config/no/hz/full/sysidle.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/completion.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/ktime.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/jiffies.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/timex.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/timex.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/param.h \
  arch/arm/include/generated/asm/param.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/asm-generic/param.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/timex.h \
  include/generated/timeconst.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/timekeeping.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/rcutree.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/no/hz/common.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/percpu.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/percpu.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/topology.h \
    $(wildcard include/config/arm/cpu/topology.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/topology.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/rbtree.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/sysctl.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/elf.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/elf.h \
    $(wildcard include/config/vdso.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/auxvec.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/uapi/asm/auxvec.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/vdso_datapage.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/user.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/elf.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/uapi/linux/elf-em.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/sysfs.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/idr.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/kobject_ns.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/kref.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/jump_label.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/extable.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/rbtree_latch.h \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/arch/arm/include/asm/module.h \
    $(wildcard include/config/arm/unwind.h) \
    $(wildcard include/config/arm/module/plts.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \
  /home/ilukic/projects/yocto/kernel-yocto/kernel-source/include/linux/vermagic.h \
  include/generated/utsrelease.h \

/home/ilukic/projects/modules/simple/src/simple.mod.o: $(deps_/home/ilukic/projects/modules/simple/src/simple.mod.o)

$(deps_/home/ilukic/projects/modules/simple/src/simple.mod.o):
