.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<

.PHONY : live
## env					: Deploy a go environment
env:
	fission environment create --name go --image fission/go-env-1.12:1.10.0 --builder fission/go-builder-1.12:1.10.0

.PHONY : create
## create					: Deploy the go function
create:
	fission fn create --name producer --env go --src producer.go --entrypoint Handler

.PHONY : update
## update					: Update the go function
update:
	fission fn update --name producer --env go --src producer.go --entrypoint Handler

.PHONY : test
## test					: Write some messages
test:
	fission fn test --name producer

.PHONY : log
## test					: Get the logs for the function
log:
	fission fn log --name=producer

.PHONY : install
## install					: Env + Create
install: env create
