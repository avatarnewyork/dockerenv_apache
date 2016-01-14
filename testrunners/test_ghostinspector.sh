#!/bin/bash

# start apache in background
docker-compose -f docker-compose.yml up -d

~/ngrok authtoken $NGROK_TOKEN

~/ngrok http -log=stdout -subdomain=$CIRCLE_SHA1 8888 > /dev/null &
  
# Wait for application and ngrok to be ready
curl --retry 10 --retry-delay 10 -v https://$CIRCLE_SHA1.ngrok.io

# Execute Ghost Inspector tests using the ngrok tunnel
curl "https://api.ghostinspector.com/v1/suites/$GHOST_SUITE_ID/execute/?apiKey=$GHOST_API_KEY&startUrl=https://$CIRCLE_SHA1.ngrok.io" > $CIRCLE_ARTIFACTS/ghostinspector.json

if [ $(grep -c '"passing":false' $CIRCLE_ARTIFACTS/ghostinspector.json) -ne 0 ]; then exit 1; fi
