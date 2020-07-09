FROM ubuntu

RUN apt-get update; apt-get install curl jq --no-install-recommends -y

COPY . .

ENTRYPOINT ["sh", "docker-entrypoint.sh"]

