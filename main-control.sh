#!/bin/bash

#suite=plucky
suite=resolute
#Uri="http://ftp.udx.icscoe.jp/Linux/ubuntu-ports/"
Uri="http://ports.ubuntu.com/ubuntu-ports"


	start_time=`date`

	sudo rm -f log?
	sudo ./build_kernel_env.sh nanopi-r6c-rk3588s_defconfig $Uri $suite kernel
	sudo ./mesa-build-env.sh arm64 $1 $Uri $suite
	#sudo ./meas-build-env.sh arm64 ubuntu $Uri $suite
	sudo ./rootfs-bootstrap.sh arm64 $Uri $suite
	sudo ./disk_image.sh arm64 nanopi-r6c rk3588s-nanopi-r6c
	sudo mv overlay/u-boot-rockchip.bin overlay/nanopi-r6c-u-boot-rockchip.bin

	echo "$start_time"
	date
