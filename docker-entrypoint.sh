#!/bin/sh

set -e

if [ -z "$WATCH_PATHS" ]; then
  echo "Must input paths to watch for changes to environment variable: WATCH_PATHS"
  exit 42
fi

if [ -z "$SERVICE_NAME" ]; then
  echo "Must input Service name to reload when change is seen, input should be for environment variable: SERVICE_NAME"
  exit 42
fi

while inotifywait -e delete,delete_self $WATCH_PATHS; do
  echo "secret updated; Reloading $SERVICE_NAME"
  kill -HUP `pidof $SERVICE_NAME`
done