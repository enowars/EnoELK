# wait for ELK
while ! curl -sq http://elasticsearch:9200; do
    echo "Waiting for elasticsearch to start...";
    sleep 3;
done
while ! curl -sq --fail http://kibana:5601/api/status; do
    echo "Waiting for kibana to start..."
    sleep 3;
done

curl -vvv -X POST -F "file=@saved-obj.ndjson" -H 'kbn-xsrf: true' http://kibana:5601/api/saved_objects/_import?overwrite=True