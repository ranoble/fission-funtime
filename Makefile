live:
	echo "Installing Fission"
	sh install.sh
	echo "Installing KEDA"
	sh keda.sh
	echo "Installing Kafka through Strimzi"
	sh kafka.sh
	echo "Building test topcs"
	sh topics.sh
	echo "Run a quick test"
	sh test.sh

upgrade:
	echo "Upgrading Fission"
	sh update.sh

topic-log:
	sh consumer.sh $(topic)

topic-log-response:
	sh consumer.sh response-topic

install-producer:
	cd go-producer && make install

produce:
	cd go-producer && make test
