---
---

**Starting ssh on Fedora**

```
systemctl start sshd.service
systemctl enable sshd.service
```

**To become 'root' user in Fedora Linux**

There is no root user record in Fedora - use the following command
`sudo su -`

**ls sorted by date/time**

use -t flag eg: 
`ls -lt`

**To tar and gzip a directory**

`tar -zcvf archive-name.tar.gz directory-name`

Where,

    -z : Compress archive using gzip program in Linux or Unix
    -c : Create archive on Linux
    -v : Verbose i.e display progress while creating archive
    -f : Archive File name

**To add additional ssh keys to ssh-agent**

To add an arbitrary private key, give the path of the key file as an argument to ssh-add. For example,
`ssh-add ~/.ssh/jf_github`
would add the file ~/.ssh/jf_github

**To remove ssh key(s) from ssh-agent**

`ssh-add -D` removes all keys

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

