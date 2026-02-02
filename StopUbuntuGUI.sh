if systemctl is-active --quiet xrdp; then
	sudo systemctl stop xrdp
	echo Stopped Ubuntu GUI
else
	echo Ubuntu GUI is not Running
fi

sudo pkill -u $USER
