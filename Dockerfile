FROM java
MAINTAINER tobe tobeg3oogle@gmail.com

RUN apt-get -y update

RUN apt-get install -y git
RUN apt-get install -y maven
RUN apt-get install -y vim

RUN apt-get install -y scala
RUN apt-get install -y gradle

RUN git clone https://github.com/apache/kafka.git

WORKDIR /kafka

EXPOSE 9092

CMD /bin/bash
