---
---
## Creating a Shell with environment vars from Consul
### PYTHON

`sudo -u deploy -i
cd src/newman/current/
source <(/etc/apps/config/deploy/render_config newman)
env/bin/python manage.py shell`

type "exit" or ctl-d to leave the deploy shell and return to your prior user

###  RUBY ***

for infosphere
there's a script on there called `console_quickstart`
I believe it loads up the `bundle exec rails console` with some extra vars like the consul config (_I think_ on this latter part)
so once you are on the server you'd do `sudo -u deploy bash /var/deploy/src/infosphere/current/console_quickstart.sh`
and then the interaction is the same as it would be if you were local doing `bundle exec rails console`


## To check if VPN tunnel is up to Clients ##

These commands must be performed on the relevant server

### Comcast ###
`nc -z -v -w 1 proxyweb.comcast.com 443`

### NRG ###

**To get NRG api from Google**
`dig @8.8.8.8 api.nrg.com +short`
should return 158.81.201.189
**To get ip for nrg from loacl dns**
`dig nrg.api.com +short`

**To check connectivity with result returned from Google**
`nc -z -v -w 1 $(dig @8.8.8.8 api.nrg.com +short) 443`
**To check connectivity from local erver**
`nc -z -v -w 1 api.nrg.com 443`




## Redis

**To delete multiple keys based on a wildcard**

In the shell type something like (to delete all keys that start with "humana:*")
`redis-cli KEYS "humana:*" | xargs redis-cli del`

**To delete items from the redis registry**

access the redis host
`$ redis-cli -h <redis host> (something like redis-primary.qa.ause2)`

to see if the entry you want to delete exists
`$ hget psh-registry-qa <service>::<version> (something like adtalem-auc-lead-submit::1.0)`
`$ hget psh-registry-production ping::1.0`

*locally*

`$ hget psh-registry <service>::<version> (something like adtalem-auc-lead-submit::1.0)`

to delete the entry
`$ hdel psh-registry-qa <service>::<version> (something like adtalem-auc-lead-submit::1.0)`

**to view the registry in a browser**
`localhost:8000/registry/tasks`

*or in production*
`psh.leapfrogonline.net/registry/tasks`

**redis memory alerts**

To run the script to expire sessions for a rogue bot ip
get the redisreporter repo https://github.com/iprospect-usa/redisreporter

`$ env/bin/python mulderexpire.py --host redis-primary.production.ause2 --ip <ip to remove e.g. 94.156.174.137> --limit 10000 --expire 5`

**To see if redis secondary was marked as the master, and how to restart redis**

`redis-cli -h redis-secondary.qa.ause2`  
then run the `info` command. 
There is a `Replication` section in the output that details the role the server is currently playing

If you have access to start/stop the redis service. It would follow the normal start/stop of an lfo daemon.
`sudo systemctl stop redis.service`

wait for sentinel to
 
1. detect the instance being down and 
2. switch the server roles around

then 
`sudo systemctl start redis.service`

## artifactory

When having trouble acessing artifactory (from a make script) An error like

`"HTTPError Could not fetch specs from https://gems.leapfrogonline.net/"`

Try stopping the vpn and restarting it.

### To Deploy a library to artifactory

1. Goto artifactory.leapfrogonline.net/
2. On the left under "Artifactory" select "Artifacts"
3. In the upper right click "Deploy"
4. To deploy a Python library, under "Target Repository" select "lfo-pypy"
5. Select the library to deploy
6. Click "Deploy" (no need to check any other options)



## epi
**sample curl string:**
`curl -X POST localhost:9707/v1/valid_zipcode/0.2.0 -H "Content-Type: application/x-www-form-urlencoded" -d api_token=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX`

`curl -X POST https://qa-epi.leapfrogonline.com/v1/external_configuration/1.0 -H "Content-Type: application/x-www-form-urlencoded" -d api_token=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -d flow_id=46`

## hashi

**to look at events in the hashi db**

to log in

`psql -h db1.qa.ause2 -U hashi -p 9999`
^^^^^^^ logs into hashi database in qa  
-h from consul services  
-U from consul hashi config postgress_username  
-p from consul hashi config postgress\_port  

will prompt for password get it from
consul hashi config postgres\_password

`select * from messages where topic='preview.events.geo_locate.census_features';`

*to see a the last event*
`select max(id) from messages;`
`select * from messages where id=<id returned above>;`
`select * from messages where event=events.whatever.whatever.whatever`

*another query for events*
`select * from messages where body -> 'v1' ->> 'flow_id' = '81';`
`select * from messages where body -> 'v1' ->> 'event_guid' = 'bc3a9dc1-ca41-4f2f-aa05-6d4f3e49e696';`


## prometheus
**To start the prometheus exporter for phoenix**

`export SKIP_SERVICE_REGISTRATION=1`
`export PROMETHEUS_EXPORTER_PORT=9932`
`bundle exec foreman run -e .env,.env_local lfo-prometheus-exporter --name phoenix`

## Consul
To get the consul ACL master Token look in aws dashboasrd:

## Cron Jobs deployed on servers
To see what cron jobs are deployed on servers use the command:
`ls /etc/cron.d_deployed/`

To check cron messages use:
`less /var/log/cron`

To remove cron jobs from a server 
execute the following command on the server(s) where the cron(s) run
`sudo /usr/bin/cron_config_remove <remote_name>`
remote name is the app name + the role from catallina.yml 
So for psh-cox on the tolls server it would be psh-cox_tools  

The catalina command that does this is in the catalina repo at
`https://github.com/gdo-media-usa/catalina-cron/blob/main/cron.rb#L63`
