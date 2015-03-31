# Standalone Kafka

## Introduction

We run kafka in container and make it super easy to develop, test and benchmark.

It's painless and everyone can setup kafka environment within seconds!

![](kafka.png)

## Usage

```
sudo docker run -d --net=host tobegit3hub/standalone-kafka
```

It exposes 2181 for ZooKeeper and 9092 for Kafka. Just connect with them like local processes.

## Tutorial

You can run all the commands from [kafka docuemnts](http://kafka.apache.org/documentation.html).

```
➜ cd kafka

➜  bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
Created topic "test".

➜  bin/kafka-topics.sh --list --zookeeper localhost:2181
test

➜  bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
This is a message
This is another message
^C

➜  bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic test --from-beginning
This is a message
This is another message
```
