#!/bin/sh

#list formatting
list="$(lsblk | grep -v disk | awk '{print $1,$4,$7}' | cut -c 7-)"
list="$(echo "$list" | grep -v sda | sed "1 d" | grep .)"

if [ -z "$(df | grep simple)" ]; then
	phones="$(simple-mtpfs -l)"
else phones="$(df | grep simple | awk '{print $1,$2,$6}')"
fi

[ -n "$phones" -a -n "$list" ] && list="$list""$(printf "\n$phones")"
[ -n "$phones" -a -z "$list" ] && list="$(echo "$list""$phones")"

[ -n "$list" ] && devsel="$(echo "$list" | dmenu -l 10)" 
#[ -z "$list" ] && ~/.local/bin/notif.sh mt: no new devices

dev="$(printf "$devsel" | awk '{print $1}')"
mountp="$(printf "$devsel" | awk '{print $3}')"

#mount/unmount $dev

if [ "$devsel" -a -n "$(printf "$devsel" | grep sd)" ]; then
	dev="/dev/$dev"
	if [ -z  "$mountp" ]; then 
		udisksctl mount -b "$dev"
		#~/fl/sc/notif.sh mt: mounted $dev
	else
		udisksctl unmount -b "$dev"
		#~/fl/sc/notif.sh mt: unmounted $dev
	fi
else
	if [ "$devsel" -a -n "$(printf "$devsel" | grep '\(MTP\)')" ]; then 
		dev=$(echo ${dev:0:1})
		#simple-mtpfs --device $dev ~/cel && ~/fl/sc/notif.sh mt: mounted $dev || ~/fl/sc/notif.sh mt: could not mount "$dev"
	else
		[ -n "$devsel" ] && fusermount -u $mountp
		#&& ~/fl/sc/notif.sh mt: unmounted $dev
	fi 
fi

#if anidado: si el tercer campo de devselect no es nulo, montar
#si el campo es nulo, desmontar
#en cualquiera de los dos casos, inmediatamente después dar 
#formato para que devselect se converta solo en el nombre (o
#número) del dispositivo
	#si devsel no empieza con s, quitar el :, ejecutar simple mtpfs
	#y enviar notificación de que se montó el teléfono en cell/
	#mounted media in ~/cell

##2 ifs
##[ -z printf "$devsel" | awk '{print $3}' ]
##[ -z grep "$devsel" sd ]
