# Glances

set username and password and save it (https://github.com/nicolargo/glances/issues/1674).

	sudo glances --username --password -w

Copy service file

	sudo nano /usr/lib/systemd/system/glances.service

Start daemon

	sudo systemctl daemon-reload
	sudo systemctl restart glances.service
	sudo systemctl status glances.service
