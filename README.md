
## Links

- https://www.digitalocean.com/community/tutorials/how-to-install-apache-kafka-on-ubuntu-14-04
- http://kafka.apache.org/documentation.html#quickstart


## Example Usage

	echo "Hello, World" | /opt/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic TutorialTopic

	/opt/kafka/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic TutorialTopic --from-beginning


