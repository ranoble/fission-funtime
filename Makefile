.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<

.PHONY : live
## live					: Build your fill fission environment, ready for events, using a clean Kube and Helm install.
live:
	echo "Installing Fission"
	sh install.sh
#	echo "Installing KEDA"
#	sh keda.sh
	echo "Installing Kafka through Strimzi"
	sh kafka.sh
	echo "Building test topcs"
	sh topics.sh
	echo "Run a quick test"
	sh test.sh

.PHONY : upgrade
## upgrade				: Rebuild fission, using the defined values file.
upgrade:
	echo "Upgrading Fission"
	sh update.sh

.PHONY : topic-log
## topic-log topic=topic-name		: Build a kafka consumer to consume a defined topic.
topic-log:
	sh consumer.sh $(topic)

.PHONY : topic-log-response
## topic-log-response			: Monitor the response topic
topic-log-response:
	sh consumer.sh response-topic

.PHONY : install-producer
## install-producer			: Build the test go producer
install-producer:
	cd go-producer && make install

.PHONY : install-consumer
## install-consumer			: Build the test go producer
install-consumer:
	cd kafka-function-js && make install

.PHONY : produce
## produce				: Provided the producer is registered - lets make some messages
produce:
	cd go-producer && make test
