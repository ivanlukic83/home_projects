#!/bin/bash 

# usage:
# deploy.sh <IP_SUFF> <IMG_EXTENSION>

# build kernel
make CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm -C /home/ilukic/project/linux-3.12.10-ti2013.12.01 O=$(pwd) -j 4

# check exit status
ret_code=$?

# deploy zImage & dtb
if [[ $ret_code == 0 ]]; then 
	sshpass -p "" scp -o StrictHostKeyChecking=no arch/arm/boot/zImage root@10.240.16.$1:/boot/zImage.$2; 
	sshpass -p "" scp -o StrictHostKeyChecking=no arch/arm/boot/dts/am335x-sps-revA.dtb root@10.240.16.$1:/boot/am335x-sps-revA.dtb.$2; 
else
	echo "Error while Kernel compilation: stopping!"
	exit 1
fi

ret_code=$?
# deploy modules (-t of xargs is used to print command before executing it)
if [[ $ret_code == 0 ]]; then 
	find -name *.ko | xargs -I% -t sshpass -p "" scp -o StrictHostKeyChecking=no % root@10.240.16.$1:/lib/modules/3.12.10-ti2013.12.01/kernel/%; 
else
	echo "Error while copying zImage:stopping!"
	exit 2
fi

# timestamp 
date

# module dependencies
sshpass -p "" ssh -o StrictHostKeyChecking=no root@10.240.16.$1 '/sbin/depmod -a'

#reboot target
sshpass -p "" ssh -o StrictHostKeyChecking=no root@10.240.16.$1 '/sbin/reboot'
