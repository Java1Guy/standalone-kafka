#!/bin/bash

wget http://mirror.catn.com/pub/apache/kafka/0.10.1.1/kafka_2.11-0.10.1.1.tgz
tar zxvf kafka_*.tgz
rm kafka_*.tgz
rm -rf kafka
mv kafka_* kafka

# Replace advertised hostname with loopback ip in server config
sed -ir "s/^.*\(advertised.listeners\)=\(.*\)/\1=localhost/g" kafka/config/server.properties

# Also turn on topic deletion as it makes testing easier
echo -e "\n# Enable topic deletions\ndelete.topic.enable = true" >> kafka/config/server.properties
