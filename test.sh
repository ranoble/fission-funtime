fission env create --name nodejs --image fission/node-env:latest
curl -LO https://raw.githubusercontent.com/fission/fission/master/examples/nodejs/hello.js
fission function create --name hello --env nodejs --code hello.js
fission function test --name hello
fission env delete --name=nodejs
fission function delete --name hello
rm hello.js

