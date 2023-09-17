#!/bin/bash

python3 ./cats/app.py &
echo "PID of cats process: $!"
rm cats-pid
echo "$!" >> cats-pid

python3 ./flask-mongo/hello.py &
echo "PID of flask-mongo process: $!"
rm api-pid
echo "$!" >> api-pid

tail -f /dev/null
