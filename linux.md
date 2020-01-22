---
---

**To connect to a wireless network from the command line**

First, run

`nmcli c`

This will list your connections, with the first column being the SSID, and the second column being the UUID of the connection.
Copy the UUID of the SSID you want to connect to so you can paste it into the next command.

Next, run

`nmcli c up uuid <paste uuid here>`


**To flush DNS cache**

Nothing to do on Fedora. There is no DNS cache system by default.
It might be necessary to clear the browser cache


