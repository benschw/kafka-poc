#!/bin/bash

#VERSION=0.8.2.1
VERSION=0.9.0.1


if [ ! -d "/opt/kafka" ]; then

	sudo apt-get update
	sudo apt-get install -y default-jre zookeeperd

	service zookeeper start

	wget "http://apache.claz.org/kafka/${VERSION}/kafka_2.11-${VERSION}.tgz" -O /opt/kafka.tgz
	
	mkdir -p /opt/kafka
	
	cd /opt/kafka/
	tar -xzf /opt/kafka.tgz --strip 1

	cp /vagrant/server.properties /opt/kafka/config/server.properties

fi


if ! which kafkat >/dev/null; then
	sudo apt-get install -y ruby ruby-dev build-essential
	sudo gem install kafkat --source https://rubygems.org --no-ri --no-rdoc
	cp /vagrant/kafkatcfg /home/vagrant/.kafkatcfg
fi


psOut=$(ps -ef | grep kafka | wc -l)
let running=psOut-2

if [[ ( "$running" == 0 ) ]]; then
	nohup /opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties > /var/log/kafka.log &

fi
