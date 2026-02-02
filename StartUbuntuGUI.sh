XRDP_PORT=$(grep -Po '(?<=^port=)\d+' /etc/xrdp/xrdp.ini)

launch_rdp() {
	/mnt/c/Windows/System32/mstsc.exe /v:localhost:$XRDP_PORT
}

get_xrdp_status() {
	systemctl is-active --quiet xrdp
}

sudo pkill -u $USER

if ! get_xrdp_status; then

	sudo systemctl start xrdp
	echo Started Ubuntu GUI

	launch_rdp
else

	echo Ubuntu GUI already Running

	read -p "Enter Yes to reconnect to the GUI: " confirmation

	if grep -iq "yes" <<< "$confirmation"; then
		launch_rdp
		echo Reconnecting to Ubuntu GUI
	fi
fi

if ! get_xrdp_status; then
	echo Stopped Ubuntu GUI
else
	echo Disconnected from Ubuntu GUI
fi
