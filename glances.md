# Glances

https://www.how2shout.com/linux/install-and-use-glances-to-monitor-ubuntu-20-04-server-or-desktop/#Create_Glances_Service_file_to_run_in_the_background

https://www.how2shout.com/linux/install-and-use-glances-to-monitor-ubuntu-20-04-server-or-desktop/

https://www.home-assistant.io/integrations/glances/

https://glances.readthedocs.io/en/latest/

set username and password and save it (https://github.com/nicolargo/glances/issues/1674).

	sudo glances --username --password -w

Copy service file

	sudo nano /usr/lib/systemd/system/glances.service

Start daemon

	sudo systemctl daemon-reload
	sudo systemctl restart glances.service
	sudo systemctl status glances.service
