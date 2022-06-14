#!/bin/bash

echo "STAGE 1: BASE"

#RUN fdisk -l

device=$1
hostname=$2
user=$3


timedatectl set-ntp true

fdisk $device
#config partitioning
pacman -S dosfstools
mkfs.fat -F32 "$device"1
mkswap "$device"2
swapon "$device"2
mkfs.ext4 "device"3

mount "$device"3 /mnt
pacstrap /mnt base linux-lts linux-firmware
fstabgen -U /mnt >> /mnt/etc/fstab
artix-chroot /mnt

ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
hwclock --systohc
pacman -S vim doas
sed -i '/es_MX\.UTF-8/s/^#//' /etc/locale.gen
locale-gen
echo "LANG=es_MX.UTF-8" >> /etc/locale.conf
echo "KEYMAP=la-latin1" >> /etc/vconsole.conf
echo "127.0.0.1   localhost" >> /etc/hosts
echo "::1         localhost" >> /etc/hosts
echo "127.0.1.1   $hostname.localdomain   $hostname" >> /etc/hosts

passwd
useradd -m $user
passwd $user
usermod -aG wheel,audio,video,input,power,optical,storage,lp,scanner,dbus,adbusers,uucp,vboxusers $user
doas cp configs/doas.conf /etc/doas.conf

echo "[extra]
Include = /etc/pacman.d/mirrorlist-arch

[community]
Include = /etc/pacman.d/mirrorlist-arch

[multilib]
Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf
pacman-key --populate archlinux
doas pacman -Sy

doas pacman -S artix-archlinux-support
doas pacman -S --needed base-devel
doas pacman -S polkit ntfs-3g wget git unzip dhcpcd-runit iwd-runit
sv up dhcpcd-runit
sv up iwd-runit
doas pacman -S grub efibootmgr dosfstools os-prober mtools 
#TODO: ver si se puede instalar todo solo con wifi

mount /dev/sda1 /boot/EFI
mkdir /boot/efi
grub-install $device --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=grub_uefi --recheck --removable
grub-mkconfig -o /boot/grub/grub.cfg 

exit
umount -R /mnt
reboot
