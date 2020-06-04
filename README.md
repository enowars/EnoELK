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

Log Format:

```ts
interface EnoLogMessage {
  tool: string;                                                           //"ExampleChecker"
  type: string;                                                           //"infrastructure"
  severity: "CRITICAL" | "ERROR" | "WARNING" | "INFO" | "DEBUG";
  severityLevel: number;                                                  //Debug = 0
  timestamp: string;                                                      //"2020-06-02T11:59:24.794Z"
  module: string | null;                                                  //"ExampleChecker.ExampleChecker"
  function: string | null;                                                //"ExampleChecker.ExampleChecker.exampleputflag"
  flag: string | null;                                                    //"ENOFlag"
  flagIndex: number | null;                                               //0
  runId: number | null;                                                   //241335
  roundId: number | null;                                                 //4
  relatedRoundId: number | null;                                          //3
  message: string;                                                        //"Fetching Users with relrID29, tIdis:205"
  teamName: string | null;                                                //"teamname205"
  teamId: number | null;                                                  //205
  serviceName: string | null;                                             //"ExampleService"
  method: "putflag" | "getflag" | "putnoise" | "getnoise" | "havoc" | null;
}
```
