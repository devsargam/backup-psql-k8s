#!/bin/bash

BACKUP_FILENAME="${BACKUP_PREFIX}_$(date +%Y%m%d_%H%M%S).sql"

pg_dump postgres://$DB_USER:$DB_PASS@$DB_HOST:5432/$DB_NAME?sslmode=require > ./$BACKUP_FILENAME

curl --request PUT \
     --url $BUNNY_ENDPOINT/$BACKUP_FILENAME \
     --header 'AccessKey: '$BUNNY_API_KEY \
     --header 'Content-Type: application/octet-stream' \
     --header 'accept: application/json'  \
     --data-binary @$BACKUP_FILENAME

rm $BACKUP_FILENAME

