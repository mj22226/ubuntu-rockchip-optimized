#!/bin/bash

#suite=plucky
suite=resolute
#Uri="http://ftp.udx.icscoe.jp/Linux/ubuntu-ports/"
Uri="http://ports.ubuntu.com/ubuntu-ports"


	start_time=`date`

	sudo rm -f log?
	sudo ./build_kernel_env.sh rock-pi-4-rk3399_defconfig $Uri $suite kernel
	sudo ./mesa-build-env.sh arm64 $1 $Uri $suite
	sudo ./rootfs-bootstrap.sh arm64 $Uri $suite
	sudo ./disk_image.sh arm64 rock-pi-4b rk3399-rock-pi-4b
	sudo mv overlay/u-boot-rockchip.bin overlay/rock-pi-4b-u-boot-rockchip.bin

	echo "$start_time"
	date
