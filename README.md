# Standalone Kafka

## Introduction

We run kafka (0.9.0.0) in container and make it super easy to develop, test and benchmark.

It's painless and everyone can setup kafka environment within seconds!

We fixed the advertised host name in default config so that it will work with docker-machine too.

![](kafka_docker.png)

## Usage

```
docker run -d --net=host -e HOSTNAME=localhost tobegit3hub/standalone-kafka
```

It exposes 2181 for ZooKeeper and 9092 for Kafka. Just connect with them like local processes.

If you use `docker-machine` (for example on OS X) you can still use localhost binding by running the following command:

```
docker-machine ssh default -f -N -L 9092:localhost:9092 -L 2181:localhost:2181
```

Change `default` if you are using an alternate machine.

**Note:** you need a recent version of docker-machine for this to work. Known to work on 0.5.6.

## Tutorial

You can run all the commands from [kafka documents](http://kafka.apache.org/documentation.html).

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
