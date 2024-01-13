# Replication
- A replica set in MongoDB is a group of `mongod` processes that maintain the same data set.
- Replica set contains several data-bearing nodes but only one is primary (+ optionally one arbiter node).
- Primary records all changes to its data sets in its operation log (i.e. oplog).
- The secondaries replicate the primary’s oplog and apply the operations to their data sets (Asynchronously).
- If the primary is unavailable, an eligible secondary will hold an election to elect itself as the new primary.

## What is the difference between replication and sharding?
- Think of it like a pizza:
  - With replication: you are making a copy of a complete pizza pie on every server.
  - With sharding, you’re sending pizza slices to several different replica sets.
  - Combined together, you have access to the entire pizza pie.
- Replication and sharding can work together to form something called a sharded cluster, where each shard is replicated in turn to preserve the same high availability.

# Sharding:
- MongoDB supports horizontal scaling through sharding.
- At the collection level, distributing the collection data across the shards in the cluster.
- Sharded Cluster consists of:
  - **Shard**: contains a subset of the sharded data + can be deployed as a replica set.
  - **`Mongos`**: acts as a query router providing interface between client apps and the sharded cluster.
  - **Config servers**: store metadata and configuration settings for the cluster.
- Once a collection has been sharded, MongoDB provides no method to unshard a sharded collection.
- Shards are implemented by using clusters which are nothing but a group of MongoDB instances.
- More details about Shard Key are needed.
## Step by Step Sharding Cluster Example:

  - **Create Docker network for the cluster:**
    ```
    docker network create --driver bridge xnet
    ```
  - **Run config node:**
    ```
    docker run -it --rm --net=xnet -p 27016:27016 \
    --hostname config-1 --name config-1 \
    mongo:3.4.9 --port 27016 --replSet config --configsvr
    ```
  - **Init config node:**
    ```
    docker exec -it config-1 mongo --port 27016 --eval '
    rs.initiate({ _id: "config", members: [
        { _id : 0, host : "config-1:27016" }
    ]});'
    ```
  - **Run router node:**
    ```
    docker run -it --rm --net=xnet -p 27015:27015 \
    --hostname mongos --name mongos \
    mongo:3.4.9 mongos \
    --port 27015 --configdb config/config-1:27016
    ```
  - **Run nodes for shard 1 & 2:**
    ```
    docker run -it --rm --net=xnet -p 27018:27018 \
    --hostname shard-1 --name shard-1 \
    mongo:3.4.9 --port 27018 --shardsvr
    ```
    ```
    docker run -it --rm --net=xnet -p 27019:27019 \
    --hostname shard-2 --name shard-2 \
    mongo:3.4.9 --port 27019 --shardsvr
    ```
  - **Configure sharding cluster:**
    ```
    docker exec -it mongos mongo --port 27015 --eval '
    sh.addShard("shard-1:27018");
    sh.addShard("shard-2:27019");
    sh.enableSharding("test_db");
    sh.shardCollection("test_db.test_collection", {"tag": 1});
    sh.status();'
    ```
  - **Testing by creating a single document and printing some info:**
    ```
    docker exec -it mongos mongo --port 27015 test_db --eval '
        db.test_collection.save({tag: "mongo", code: "200"});
        db.test_collection.find({tag: "mongo"}).explain();'
    ```

# Resources:
- [MongoDB Docs](https://docs.mongodb.com/)
- [MongoDB Basics](https://docs.mongodb.com/manual/)
- [Medium](https://medium.com/)
