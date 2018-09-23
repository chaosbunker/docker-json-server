FROM node:alpine
MAINTAINER Dennis Rodewyk <ufo@chaosbunker.com>

RUN npm install -g json-server

WORKDIR /json-server/data

VOLUME /json-server

EXPOSE 3000

ADD run.sh /run.sh

ENTRYPOINT ["sh", "/run.sh"]

CMD []
