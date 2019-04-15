# EnoELK
EnoELK is the central log storage of ENOWARS. Journald input is supposed to be provided by [journalbeat](https://www.elastic.co/guide/en/beats/journalbeat/6.7/journalbeat-installation.html).

### Running EnoELK

Elastic (and thus EnoELK) must run on systems that have `vm.max_map_count` set to 262144.

### Configuring journalbeat
Journalbeat has to feed logstash, so disable elastic and enable logstash to the journalbeat config (`/etc/journalbeat/journalbeat.yml`):
```
# output.elasticsearch:
  # Array of hosts to connect to.
  # hosts: ["localhost:9200"]

output.logstash:
  # The Logstash hosts
  hosts: ["localhost:5044"]
```
