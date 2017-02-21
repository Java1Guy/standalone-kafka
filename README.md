# Standalone Kafka

## Introduction

We run kafka (0.10.1.1) in a container and make it super easy to develop, test and benchmark.

It's painless, and everyone can setup a kafka environment within seconds!

We also enable topic deletion as it makes things simpler for testing and experimenting.

![](im_kafka_docker.png)

## Usage

Download the Kafka 0.10.1.1 distribution:

```
./download_kafka.sh
```

Then you can start the docker container:

```
docker run -d -p 2181:2181 -p 9092:9092 deviantart/standalone-kafka
```

or simply:

```
./run
```

or if you want to pass additional args to the docker run command:

```
./run --name kafka
```

This exposes ports 2181 for ZooKeeper and 9092 for Kafka. Connect to them just as if they were local processes.

## Tutorial

You can run all of the commands from [kafka documents](http://kafka.apache.org/documentation.html).

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
