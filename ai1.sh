#!/bin/bash

device=$1
hostname=$2
user=$3

echo "STAGE 1: BASE"

#RUN loadkeys la-latin1
#RUN pacman -Sy
#RUN pacman -S git glibc
#RUN git clone https://github.com/htaldo/artinst.git
#RUN fdisk -l
#RUN cd artinst
#RUN chmod +x *.sh
#RUN ./ai1.sh

fdisk $device
#config partitioning
###pacman -S dosfstools
mkfs.fat -F32 "$device"1
mkswap "$device"2
swapon "$device"2
mkfs.ext4 "$device"3

mount "$device"3 /mnt
basestrap /mnt base base-devel runit elogind-runit linux-lts linux-firmware
fstabgen -U /mnt >> /mnt/etc/fstab
artix-chroot /mnt sh /aux.sh
