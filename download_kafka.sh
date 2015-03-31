#!/bin/bash

wget http://apache.fayea.com/kafka/0.8.2.1/kafka_2.9.2-0.8.2.1.tgz
tar zxvf kafka_*.tgz
rm kafka_*.tgz
mv kafka_* kafka
