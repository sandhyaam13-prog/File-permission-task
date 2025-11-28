#!/usr/bin/env bash

URL="https://guvi.in"

status_code=$(curl -o /dev/null -s -w "%{http_code}" "$URL")
echo "HTTP Status Code: $status_code"

case "$status_code" in
  2??) echo "SUCCESS: Website is working fine." ;;
  3??) echo "REDIRECT: Website moved somewhere else." ;;
  4??) echo "FAILURE: Something wrong with your request." ;;
  5??) echo "FAILURE: Server is having a problem." ;;
  *)   echo "UNKNOWN: Unexpected response." ;;
esac


