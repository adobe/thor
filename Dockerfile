FROM node:14-slim

ENV WORKERS=8
ENV MESSAGES=10
ENV CONNECTIONS=100
ENV CONCURRENT=1
ENV OUTPUT=/report/thor.out
ENV URL="wss://test-websockets-cookie-stage.adobe.io/upgrade-request"

WORKDIR /thor
COPY ./ ./
RUN rm -rf ./node_modules
RUN mkdir /report
RUN npm install

ENTRYPOINT node ./bin/thor --workers $WORKERS --masked --concurrent $CONCURRENT --amount $CONNECTIONS --messages $MESSAGES --json --output $OUTPUT $URL
