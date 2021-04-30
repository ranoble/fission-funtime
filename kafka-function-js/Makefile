.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<

.PHONY : live
## env					: Deploy a js environment
env:
	fission env create --name nodeenv --version 3 --poolsize 1 --image fission/node-env

.PHONY : create
## create					: Deploy the js function
create:
	fission fn create --name consumer --env nodeenv --code consumer.js

.PHONY : update
## update					: Update the js function
update:
	fission fn update --name consumer --env nodeenv --code consumer.js

.PHONY : trigger
## trigger					: Register the KEDA trigger
trigger:
	fission mqt create --name kafkatest --function consumer --mqtype kafka --mqtkind keda --topic request-topic --resptopic response-topic --errortopic error-topic --maxretries 3 --metadata bootstrapServers=my-cluster-kafka-brokers.my-kafka-project.svc:9092 --metadata consumerGroup=my-group --metadata topic=request-topic  --cooldownperiod=30 --pollinginterval=5

.PHONY : log
## test					: Get the logs for the function
log:
	fission fn log --name=consumer

.PHONY : install
## install					: Env + Create
install: env create trigger
