#!/bin/bash
#
docker run -d --name db1 couchbase
docker run -d --name db2 couchbase
docker run -d --name db3 -p 8091-8096:8091-8096 -p 11210-11211:11210-11211 couchbase
