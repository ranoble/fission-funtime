env:
	fission environment create --name go --image fission/go-env-1.12:1.10.0 --builder fission/go-builder-1.12:1.10.0

create:
	fission fn create --name producer --env go --src producer.go --entrypoint Handler

update:
	fission fn update --name producer --env go --src producer.go --entrypoint Handler

test:
	fission fn test --name producer

log:
	fission fn log --name=producer

install: env create
