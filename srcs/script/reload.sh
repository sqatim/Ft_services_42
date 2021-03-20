#!/bin/sh
sh script/delete.sh
docker system prune -a -f
sh script/script.sh