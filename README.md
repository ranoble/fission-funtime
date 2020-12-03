# fission-funtime

This is a sample project to get fission and kafka up and running on a local mac using docker desktop.
See: https://blog.fission.io/posts/event-driven-scaling-fission-function-using-keda/

Just install Kube + Helm

The run `make install`

You now have fission + KEDA + Kafka

Next run `make install-producer` and `make install-consumer`

You've now installed:
 * the go producer 
 * the js consumer
 * the environemnts (go + node)
 * the keda trigger
 
open a new terminal and run `make topic-log-response` to monitor your output

and run `make produce` to send a bunch of messages and see it all work!
