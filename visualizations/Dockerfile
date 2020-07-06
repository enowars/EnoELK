FROM ubuntu

RUN apt-get update; apt-get install curl jq --no-install-recommends -y

COPY docker-entrypoint.sh docker-entrypoint.sh

ENTRYPOINT ["sh", "docker-entrypoint.sh"]

