#!/bin/bash

docker container run -p 8000:80 -d atbaker/nginx-example
curl http://192.168.99.100:8000