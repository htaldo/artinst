#!/bin/sh

options="prosim\nchemsep\ngeogebra\nrasmol\nthermosolver"
select="$(echo -e $options | dmenu)"

[ -z "$select" ] && exit

case $select in
	"chemsep")
		WINEARCH=win32 WINEPREFIX=~/.wine/chemsep wine ~/.wine/chemsep/drive_c/Program\ Files/ChemSepL8v27/bin/wincs.exe
	;;
	"geogebra")
		~/src/GeoGebra-linux-x64/GeoGebra
	;;
	"prosim")
			WINEARCH=win32 WINEPREFIX=~/.wine/prosim wine ~/.wine/drive_c/Program\ Files\ \(x86\)/ProSim\ Ternary\ Diagram/Ternaire.exe
	;;
	"rasmol")
		WINEARCH=win32 WINEPREFIX=/home/aldo/.wine/rasmol wine ~/.wine/rasmol/drive_c/Program\ Files/RasWin/raswin.exe
	;;
	"thermosolver")
		WINEARCH=win32 WINEPREFIX=~/.wine/thermosolver wine ~/.wine/thermosolver/drive_c/Program\ Files/ThermoSolver/Thermo.exe
	;;
esac
