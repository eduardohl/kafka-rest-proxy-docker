# Version and compatibility
This Dockerfile is currently configured to use the Confluent Platform version 3.2, which is compatible with Kafka 0.10.2.
In case you need to adapt it to a different Kafka version please visit:
https://docs.confluent.io/current/installation/versions-interoperability.html
Then update the confluent.repo and the Dockerfile to use the version you need.

# Running kafka-rest-proxy
docker build -t kafka-rest-proxy-docker:latest .

docker run --rm \
   -e "SCHEMA_REGISTRY_ADDRESS=http://[]:8081" \
   -e "ZK_ADDRESS="[]:2181 \
   -e "BOOTSTRAP_SERVERS_ADDRESS=[]:9092" \
   -p 8082:8082 \
   kafka-rest-proxy-docker:latest
