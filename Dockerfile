FROM alpine:3.14

RUN apk update
RUN apk add --no-cache postgresql-client
RUN apk add --no-cache curl


RUN mkdir /scripts 
COPY backup.sh /scripts
WORKDIR /scripts
RUN chmod +x backup.sh

ENTRYPOINT ["sh", "./backup.sh"]
