FROM anapsix/alpine-java

RUN mkdir /home/eventsim

COPY bin /home/eventsim/bin
COPY data /home/eventsim/data
COPY target/scala-2.10/eventsim-assembly-1.0.jar /home/eventsim/target/scala-2.10/eventsim-assembly-1.0.jar
COPY examples /home/eventsim/examples
COPY configs /home/eventsim/configs

ENV LANG=en_US.UTF-8

WORKDIR /home/eventsim
CMD ["bin/eventsim", "-c examples/alt-example-config.json", "-f 0", "-t -10", "--nusers 100000", "--kafkaBrokerList kafka-cluster-kafka-0.kafka-cluster-broker-kafka.default.svc.cluster.local:9092", "--kafkaTopic eventsim", "--growth-rate 0.30", "--continuous"]