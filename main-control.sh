#!/bin/bash

#suite=plucky
suite=resolute
#Uri="http://ftp.udx.icscoe.jp/Linux/ubuntu-ports/"
Uri="http://ports.ubuntu.com/ubuntu-ports"


	start_time=`date`

	sudo rm -f log?
	sudo ./build_kernel_env.sh nanopi-m4-rk3399_defconfig $Uri $suite kernel
	sudo ./mesa-build-env.sh arm64 $1 $Uri $suite
	sudo ./rootfs-bootstrap.sh arm64 $Uri $suite
	sudo ./disk_image.sh arm64 nanopi-m4 rk3399-nanopi-m4
	sudo mv overlay/u-boot-rockchip.bin overlay/nanopi-m4-u-boot-rockchip.bin

	echo "$start_time"
	date
