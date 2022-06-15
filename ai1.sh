#!/bin/bash

echo "STAGE 1: BASE"

#RUN loadkeys latam
#RUN fdisk -l

device=$1
hostname=$2
user=$3

fdisk $device
#config partitioning
pacman -S dosfstools
mkfs.fat -F32 "$device"1
mkswap "$device"2
swapon "$device"2
mkfs.ext4 "$device"3

mount "$device"3 /mnt
basestrap /mnt base base-devel runit elogind-runit linux-lts linux-firmware
fstabgen -U /mnt >> /mnt/etc/fstab
artix-chroot /mnt

ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
hwclock --systohc
pacman -S vim doas
cp configs/doas.conf /etc/doas.conf

sed -i '/es_MX\.UTF-8/s/^#//' /etc/locale.gen
locale-gen
echo "LANG=es_MX.UTF-8" >> /etc/locale.conf
echo "KEYMAP=la-latin1" >> /etc/vconsole.conf
echo "127.0.0.1   localhost" >> /etc/hosts
echo "::1         localhost" >> /etc/hosts
echo "127.0.1.1   $hostname.localdomain   $hostname" >> /etc/hosts


echo "[extra]
Include = /etc/pacman.d/mirrorlist-arch

[community]
Include = /etc/pacman.d/mirrorlist-arch

[multilib]
Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf
pacman-key --populate archlinux
pacman -Sy
pacman -S artix-archlinux-support
pacman -S --needed base-devel
pacman -S polkit ntfs-3g wget git unzip dhcpcd-runit iwd-runit
doas pacman -S grub efibootmgr dosfstools os-prober mtools 

mkdir /boot/EFI
mount $device"1" /boot/EFI
grub-install $device --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=grub_uefi --recheck --removable
grub-mkconfig -o /boot/grub/grub.cfg

passwd
useradd -m $user
passwd $user
usermod -aG wheel,audio,video,input,power,optical,storage,lp,scanner,dbus,uucp $user

#TODO: ver si se puede instalar todo solo con wifi
exit
umount -R /mnt
reboot
