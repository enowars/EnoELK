#/bin/bash

docker-compose up -d elasticsearch kibana

while ! curl -sq http://localhost:9200; do
    echo "Waiting for elasticsearch to start...";
    sleep 3;
done
while ! curl -sq --fail http://localhost:5601/api/status; do
    echo "Waiting for kibana to start..."
    sleep 3;
done

curl -vvv -X POST -F "file=@./visualizations/saved-obj.ndjson" -H 'kbn-xsrf: true' http://localhost:5601/api/saved_objects/_import?overwrite=True
metricbeat setup --dashboards

docker-compose up
