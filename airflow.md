---
---

**To run a mssql query locally**

- Go to the airflow-add local directory
- In the terminal type make shell
- Enter the following python commands

```
    In [1]: import records
    In [2]: db = records.Database('mssql+pymssql://LEAPFROGONLINE\psh-adwords:a4v4a_bb3oz@sv-bidb02-prod.leapfrogonline.com:1433/dw')
    In [x]: q = """<query>"""
    In [6]: results = db.query(q)
    In [7]: results.as_dict()
```      
The string in the records.Database call can be found at: `https://consul.leapfrogonline.net/ui/ause2/kv/config/apps/tool_sched/SQL_DSN/edit`

**Files created in Airflow dags are stored at**
`tools1.qa.ause2, cd into /mnt/etlfs/airflow/files (maybe su to deploy first?)`

**To see running DAGS - to locate long running DAGS**
`https://airflow.leapfrogonline.net/taskinstance/list/?_flt_7_state=success&_flt_7_state=skipped&_flt_5_state=failed`

**To restart airflow scheduler**

- log on to the tools server
- `sudo systemctl restart lfo-datateam-airflow-scheduler-1.service`
- `sudo systemctl restart lfo-datateam-airflow-scheduler-2.service`




