---
---

**T0 login to postgres commandline**
`sudo psql –U postgres`

This logs you in as the postgres user

**To see all databases**  
while logged in as postgres user
`\l`

**To connect to a specific database**
`\c <database name>`

**To see all database tables (locally)**
`\dt`

**To list all columns in a table**
`\d+ <table name>`

**To connect to a database on a server**  
Get the connection string from the app from consul  
It will look something like   
`postgresql://<username>:<password>@rdsqadb1-primary.cluster-c6ymrjidvw9w.us-east-2.rds.amazonaws.com:<port>/<db>`
format to the following command  
`psql -h rdsqadb1-primary.cluster-c6ymrjidvw9w.us-east-2.rds.amazonaws.com -p <port> -U <username> -d <db>` 

**Search Paths**  
To see the current search_path
`show search_path;`

To change the current search_path
`set search_path="<new search path>"`
