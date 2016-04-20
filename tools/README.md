# Sarama tools
## kafka-console-consumer

A simple command line tool to consume partitions of a topic and print the
messages on the standard output.

### Usage

    # Minimum invocation
    kafka-console-consumer -topic=test -brokers=kafka1:9092

    # It will pick up a KAFKA_PEERS environment variable
    export KAFKA_PEERS=kafka1:9092,kafka2:9092,kafka3:9092
    kafka-console-consumer -topic=test

    # You can specify the offset you want to start at. It can be either
    # `oldest`, `newest`. The default is `newest`.
    kafka-console-consumer -topic=test -offset=oldest
    kafka-console-consumer -topic=test -offset=newest

    # You can specify the partition(s) you want to consume as a comma-separated
    # list. The default is `all`.
    kafka-console-consumer -topic=test -partitions=1,2,3

    # Display all command line options
    kafka-console-consumer -help

## kafka-console-producer

A simple command line tool to produce a single message to Kafka.

### Usage

    # Minimum invocation
    kafka-console-producer -topic=test -value=value -brokers=kafka1:9092

    # It will pick up a KAFKA_PEERS environment variable
    export KAFKA_PEERS=kafka1:9092,kafka2:9092,kafka3:9092
    kafka-console-producer -topic=test -value=value

    # It will read the value from stdin by using pipes
    echo "hello world" | kafka-console-producer -topic=test

    # Specify a key:
    echo "hello world" | kafka-console-producer -topic=test -key=key

    # Partitioning: by default, kafka-console-producer will partition as follows:
    # - manual partitioning if a -partition is provided
    # - hash partitioning by key if a -key is provided
    # - random partioning otherwise.
    #
    # You can override this using the -partitioner argument:
    echo "hello world" | kafka-console-producer -topic=test -key=key -partitioner=random

    # Display all command line options
    kafka-console-producer -help
