#!/bin/bash

device=$1
hostname=$2
user=$3

ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
hwclock --systohc
#gvim allows to use the clipboard buffer
pacman --noconfirm -S gvim doas
echo "permit persist :wheel
permit nopass :wheel as root cmd /sbin/poweroff
permit nopass :wheel as root cmd /sbin/reboot
permit nopass :wheel as root cmd /usr/bin/tee
" >> /etc/doas.conf

sed -i '/es_MX\.UTF-8/s/^#//' /etc/locale.gen
locale-gen
echo "LANG=es_MX.UTF-8" >> /etc/locale.conf
echo "KEYMAP=la-latin1" >> /etc/vconsole.conf
echo "$hostname" >> /etc/hostname
echo "127.0.0.1   localhost
::1         localhost
127.0.1.1   $hostname.localdomain   $hostname" >> /etc/hosts

#Repositories (NOTE: Assuming x86_64 architecture)
sed -i '/\[lib32\]/s/^#//' /etc/pacman.conf
#uncomment the next line (#Include = ...)
sed -i '/\[lib32\]/{n;s/#//}' /etc/pacman.conf
echo "
[universe]
Server = https://universe.artixlinux.org/x86_64
Server = https://mirror1.artixlinux.org/universe/x86_64
Server = https://mirror.pascalpuffke.de/artix-universe/x86_64
Server = https://artixlinux.qontinuum.space/artixlinux/universe/os/x86_64
Server = https://mirror1.cl.netactuate.com/artix/universe/x86_64
Server = https://ftp.crifo.org/artix-universe/" >> /etc/pacman.conf
pacman --noconfirm -Sy artix-archlinux-support
 
echo "
#Arch
[extra]
Include = /etc/pacman.d/mirrorlist-arch

[community]
Include = /etc/pacman.d/mirrorlist-arch

[multilib]
Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf
pacman-key --populate archlinux

pacman -Sy 
pacman --noconfirm -S --needed base-devel 
pacman --noconfirm -S polkit ntfs-3g wget git unzip dhcpcd-runit iwd-runit grub efibootmgr dosfstools os-prober mtools
ln -s /etc/runit/sv/dhcpcd /etc/runit/runsvdir/default
ln -s /etc/runit/sv/iwd /etc/runit/runsvdir/default

mkdir /boot/efi
mount $device"1" /boot/efi
grub-install $device --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub_uefi --recheck --removable
grub-mkconfig -o /boot/grub/grub.cfg

until passwd
do
    echo "Sorry. Try again"
done
useradd -m $user
until passwd $user
do
    echo "Sorry. Try again"
done
usermod -aG wheel,audio,video,input,power,optical,storage,lp,scanner,dbus,uucp $user

#TODO: ver si se puede instalar todo solo con wifi
exit
