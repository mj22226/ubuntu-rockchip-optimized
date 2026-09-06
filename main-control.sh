#!/bin/bash

#suite=plucky
suite=resolute
#Uri="http://ftp.udx.icscoe.jp/Linux/ubuntu-ports/"
Uri="http://ports.ubuntu.com/ubuntu-ports"


	start_time=`date`

	sudo rm -f log?
	sudo ./build_kernel_env.sh rock-3a-rk3568_defconfig $Uri $suite kernel
	sudo ./mesa-build-env.sh arm64 $1 $Uri $suite
	sudo ./rootfs-bootstrap.sh arm64 $Uri $suite
	sudo ./disk_image.sh arm64 rock-3a rk3568-rock-3a
	sudo mv overlay/u-boot-rockchip.bin overlay/rock-3a-u-boot-rockchip.bin

	echo "$start_time"
	date
