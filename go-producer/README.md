

kubectl -nfission logs storagesvc-5c6cf54c4d-54wdx

2020-12-03T09:00:05.367Z	DEBUG	storage_service	storagesvc/storagesvc.go:100	handling upload	{"filename": "/packages/producer-d98bc4de-b167-4b06-b79a-5ac09036be72-dl0q2o-h1alhs.zip"}
2020-12-03T09:00:05.384Z	DEBUG	stow_client	storagesvc/stowClient.go:125	successfully wrote file on storage	{"file": "0b80d195-263b-4cb1-ad0d-bb381ad86938"}
2020-12-03T09:08:31.223Z	DEBUG	stow_client	storagesvc/stowClient.go:151	successfully wrote file into httpresponse	{"file": "/fission/fission-functions/0b80d195-263b-4cb1-ad0d-bb381ad86938"}


fission pkg list
fission pkg info --name=producer-c21a23fd-4a9e-4f61-ac28-6459cef4a36d
fission pkg delete --force=true --name=producer-c21a23fd-4a9e-4f61-ac28-6459cef4a36d

recreate function
check logs