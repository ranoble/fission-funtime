#!/bin/bash

kubectl run kafka-consumer-`date +"%s"` -ti --image=strimzi/kafka:latest-kafka-2.5.0 --rm=true --restart=Never -- bin/kafka-console-consumer.sh --bootstrap-server my-cluster-kafka-brokers.my-kafka-project.svc:9092 --topic $1