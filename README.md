# EnoELK
EnoELK is the central log storage of ENOWARS. Journald input is supposed to be provided by [journalbeat](https://www.elastic.co/guide/en/beats/journalbeat/6.7/journalbeat-installation.html).

### Configuring journalbeat
Journalbeat has to feed logstash, so add the logstash endpoint to the journalbeat config (`/etc/journalbeat/journalbeat.yml`):
```
output.logstash:
  # The Logstash hosts
  hosts: ["localhost:5044"]
```
