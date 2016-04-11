#!/bin/bash

wget http://mirror.catn.com/pub/apache/kafka/0.9.0.1/kafka_2.11-0.9.0.1.tgz
tar zxvf kafka_*.tgz
rm kafka_*.tgz
rm -rf kafka
mv kafka_* kafka

# Replace advertised hostname with localhost in server config
cat kafka/config/server.properties \
    | sed 's/#advertised.host.name=<hostname routable by clients>/advertised.host.name=localhost/' \
    > kafka/config/server-localhost.properties

# Also turn on topic deletion as it makes testing easier
echo -e "\n# Enable topic deletions\ndelete.topic.enable = true" >> kafka/config/server-localhost.properties