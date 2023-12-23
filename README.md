# verbose-doodle-databases

list of docker compose files for databases.

## CloudBeaver

docker run --name cloudbeaver --rm -ti -p 8080:8978 -v /opt/cloudbeaver/workspace dbeaver/cloudbeaver:latest

## Cassandra

docker run --name some-cassandra --network some-network -d cassandra:tag

### same host cluster 
$ docker run --name some-cassandra2 -d --network some-network -e CASSANDRA_SEEDS=some-cassandra cassandra:tag

### different host cluster
$ docker run --name some-cassandra -d -e CASSANDRA_BROADCAST_ADDRESS=10.42.42.42 -p 7000:7000 cassandra:tag

