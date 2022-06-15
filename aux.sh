ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
hwclock --systohc
pacman --noconfirm -S vim doas
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
pacman --noconfirm -S artix-archlinux-support
pacman --noconfirm -S --needed base-devel
pacman --noconfirm -S polkit ntfs-3g wget git unzip dhcpcd-runit iwd-runit
pacman --noconfirm -S grub efibootmgr dosfstools os-prober mtools 

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
