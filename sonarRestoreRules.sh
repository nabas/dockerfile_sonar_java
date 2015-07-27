#!/bin/bash

echo "init restoring rules..." 
until $(curl --output /dev/null --silent --head --fail http://localhost:9000); do
    printf '.'
    sleep 5
done
echo "restoring rules..." 

curl -X POST -u admin:admin -F 'backup=@rules.xml' --silent http://localhost:9000/api/profiles/restore

curl -X POST -u admin:admin -d "language=java&name=defaultSonarWay" --silent http://localhost:9000/api/profiles/set_as_default

echo "restored" 