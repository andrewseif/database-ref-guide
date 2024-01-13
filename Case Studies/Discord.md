### Previous DB engines:
- MongoDB.
- Cassandra.
### Current DB engine: 
- ScyllaDB
### Why moving from MongoDB to Cassandra?
- The data and the index could no longer able to fit in RAM, and latency becomes unpredictable.
- Linear Scalability
- Automatic failover
- Low maintenance
- Predictable Performance
- Open source
- Not a blob-type store
### Why moving from Cassandra to ScyllaDB?
- Serious performance issues that required increasing amounts of effort to just maintain, not improve.
- Hot partition issue that happens in a large public server and there are a lot of reads, and since reads are expensive in Cassandra, the specific partition fall behind and causes latency spikes in all other operations.
- Garbage Collector issues: The team also spent a lot of time tuning JVM because that also pauses the operations and causes huge latency.
- ScyllaDB is a Cassandra-compatible DB but it’s written in C++.
- ScyllaDB promises better performance, faster repairs, and garbage collection-free.
### Resources:
- Discord Story:
  - [Discord: HOW DISCORD STORES BILLIONS OF MESSAGES](https://discord.com/blog/how-discord-stores-billions-of-messages)
  - [Discord: HOW DISCORD STORES TRILLIONS OF MESSAGES](https://discord.com/blog/how-discord-stores-trillions-of-messages)
- [Hackernoon: Discord Went From MongoDB to Cassandra Then ScyllaDB](https://hackernoon.com/discord-went-from-mongodb-to-cassandra-then-scylladb-why)
