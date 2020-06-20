---
---

**To see local wordpress sites on another computer on the local network**
- In wordpress Settings->General, both Wordpress Address and Site Address should point to the ip of the hosting computer
these correspond to "siteurl" and "home" in the mysql db options table. The url will look something like:
`http://192.168.1.17/~joseph/spark` 
instead of
`httpd:localhost/~joseph/spark`
- Fedora has a firewall running by default that wil block access to port 80. To disable it, run:
`sudo systemctl stop firewalld` 

