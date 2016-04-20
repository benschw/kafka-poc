

echo "Hello, World" | /opt/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic TutorialTopic

/opt/kafka/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic TutorialTopic --from-beginning


