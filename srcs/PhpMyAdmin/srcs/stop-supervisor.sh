#!/bin/sh

printf "READY\n";

while read line; do
  echo "Sqatim | Processing Event: $line" ;
  #echo "Processing Event: $line" >&2;
  kill -3 $(cat "/var/run/supervisord.pid")
done < /dev/stdin
