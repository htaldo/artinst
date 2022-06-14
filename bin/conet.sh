#!/bin/sh

select="$(echo 'INFINITUM4X1L_2.4
INFINITUM4B4F_2.4
Ubee1546
Mi\ Teléfono
Redmi\ Note\ 7
Wi-fi IPN' | dmenu -l 5)"
iwctl station wlan0 connect "$select" 
