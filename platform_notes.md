---
---
## Redis

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


## epi
**sample curl string:**
`curl -X POST localhost:9707/v1/valid_zipcode/0.2.0 -H "Content-Type: application/x-www-form-urlencoded" -d api_token=ERLNcpxusNI6isCGVEulrMUDWicvgtXC`

`curl -X POST https://qa-epi.leapfrogonline.com/v1/external_configuration/1.0 -H "Content-Type: application/x-www-form-urlencoded" -d api_token=Rr3mrguFGXYfn2ncnZBbskcxnTruV5xD -d flow_id=46`

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
