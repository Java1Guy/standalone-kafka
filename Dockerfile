FROM java:
MAINTAINER tobe tobeg3oogle@gmail.com

RUN apt-get update

RUN apt-get install git
RUN apt-get install maven

RUN git clone https://github.com/apache/kafka.git

# bin/kafka-server-start.sh config/server.propertie

# bin/kafka-topics.sh --create --zookeeper localhost:2182 --replication-factor 1 --partitions 1 --topic test-topic

# bin/kafka-topics.sh --list --zookeeper localhost:2182

WORKDIR /

EXPOSE 9092

CMD /bin/bash
