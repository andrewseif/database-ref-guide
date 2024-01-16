# Cassandra Overview

Cassandra is a NoSQL distributed database known for its unique attributes:

- **Distributed Databases:** Cassandra databases are distributed, ensuring data distribution across multiple nodes.
- **Prevention of Data Loss:** The distribution mechanism acts as a safeguard against data loss resulting from hardware failure in any specific datacenter.
- **Scalability:** To leverage the full potential of Cassandra, it is recommended to run it on multiple machines, allowing for scalability and enhanced performance.
- **Node Communication:** Nodes in Cassandra communicate with each other using a protocol known as **gossip**. This protocol facilitates peer-to-peer communication among computers within the Cassandra cluster.

  ![image](https://github.com/Mostafahassen1/Hospital-System/assets/134046265/eb16dc2f-2f45-464c-8ef5-8d829da73fc0)




  # Want more power? Add more nodes

One reason for Cassandra’s popularity is that it enables developers to scale their databases dynamically, using off-the-shelf hardware, with no downtime. You can expand when you need to – and also shrink


Perhaps you are used to Oracle or MySQL databases. If so, you know that extending them to support more users or storage capacity requires you to add more CPU power, RAM, or faster disks. Each of those costs a significant amount of money. And yet: Eventually you still encounter some ceilings and constraints.

![image](https://github.com/Mostafahassen1/Hospital-System/assets/134046265/c1cc2568-56bd-4c66-a4e7-beff60fedcd9)

####  To double your capacity or double your throughput, double the number of nodes. That’s all it takes. Need more power? Add more nodes



# partitions

the data itself is automatically distributed

![image](https://github.com/Mostafahassen1/Hospital-System/assets/134046265/b80b2a16-ec08-4f94-8316-fc038d34726e)

####  This represents a replication factor of one, or RF = 1.



# Replication ensures reliability and fault tolerance

![image](https://github.com/Mostafahassen1/Hospital-System/assets/134046265/603f4f2b-b3b0-409f-bb31-95d541bc38ae)



# Tuning your consistency

![image](https://github.com/Mostafahassen1/Hospital-System/assets/134046265/945bd0b6-dab8-49d3-b808-cede598e8f58)


### Consistency Levels in Cassandra

In Cassandra, you have the flexibility to configure consistency levels on a per-query basis. 

The **consistency level** signifies the minimum number of Cassandra nodes required to acknowledge a read or write operation to the coordinator before considering the operation successful.

As a general guideline, the selection of your consistency level (CL) is influenced by your replication factor. For instance, in a scenario where the data is replicated across three nodes:

- **Consistency Level (CL) = QUORUM:** Here, "Quorum" refers to the majority, which in this case is 2 replicas (or RF/2 + 1). Therefore, for a successful query execution, the coordinator requires acknowledgment from at least two of the replicas.




# Indexing Concepts in Apache Cassandra

Apache Cassandra offers various types of indexing, including:

### Primary Indexing

The **primary index** in Apache Cassandra corresponds to the partition key. The storage engine of Cassandra utilizes the partition key to store rows of data. This key enables efficient and rapid data lookup, as it is fundamental for matching data in the database.



### Secondary Indexing (2i)

**Secondary indexing** is the original built-in indexing designed for Apache Cassandra. These indexes are considered local and are stored in a concealed table on each node within a Cassandra cluster. They are distinct from the table that contains the indexed values. It's important to note that utilizing secondary indexing is advisable only when used in combination with a partition key.

![image](https://github.com/Mostafahassen1/Hospital-System/assets/134046265/3be9f086-2019-48dc-b8fa-9b3c7a722b05)

![image](https://github.com/Mostafahassen1/Hospital-System/assets/134046265/e03d6111-3fcc-4bb7-948b-b53a5a5d5bcb)

![image](https://github.com/Mostafahassen1/Hospital-System/assets/134046265/fb3fd9b6-815b-45e0-b610-46c0810dd106)

![image](https://github.com/Mostafahassen1/Hospital-System/assets/134046265/190d3d89-b52f-499c-80b3-da9367497649)




# Storage Engine in Cassandra

Cassandra operates on a distributed architecture termed as a distributed hash table (DHT), differing significantly from traditional relational databases like MySQL in terms of its data storage model.

The internal storage architecture in Cassandra, known as the **Storage Engine**, serves the crucial role of handling data distribution, replication, and storage across the entire cluster. Unlike MySQL, Cassandra does not offer pluggable or selectable storage engines.



# Trie Memtables: In-Memory Data Structures in Cassandra

**Memtables** serve as an in-memory data structure acting as a staging area for recently updated data within Cassandra. 
             When data is written to Cassandra, it is initially stored in Memtables before being flushed to on-disk storage.

### Trie-Organized

**Trie Memtables** utilize a data structure called a trie to organize data efficiently.

### Garbage Collection Friendly

Trie Memtables are equipped with internal memory management mechanisms that significantly reduce the workload required for garbage collection. 
This reduction in garbage collection tasks helps minimize GC-inflicted pauses and higher-percentile latencies.

### Reducing Write Amplification
Write amplification refers to the scenario where a system writes more data to storage than the actual application data being written. 
This phenomenon stems from underlying system processes such as data organization, metadata updates, and internal bookkeeping.

In databases, minimizing write amplification is crucial for optimizing performance and resource utilization.
Memtables, including Trie Memtables, play a pivotal role in reducing write amplification. Specifically,
Trie Memtables contribute to further minimizing this phenomenon by optimizing memory allocation and write organization.



# Trie-Indexed SSTables: Persistent Data Structures in Cassandra

### Persistent Data Structure

**SSTables**, or Sorted String Tables, serve as the on-disk storage mechanism in Apache Cassandra.
             They offer a streamlined and efficient approach to store immutable sets of data.

### Log-Structured Storage

SSTables act as the foundational elements within Cassandra's log-structured storage architecture.
This design principle dictates that data is exclusively appended to files, avoiding updates or overwrites.
Whenever data changes occur, a new SSTable is created, while the older data remains intact.

# Data Update Process in Cassandra

During a write operation, Cassandra adds each new row to the database without checking for the existence of a duplicate record.
This policy can result in the coexistence of multiple versions of the same row within the database. For further insights into writes, 
refer to the section on "How is data written?"



Periodically, the rows residing in memory are streamed onto disk and stored in structures known as **SSTables**.
Cassandra performs compaction at specific intervals, where smaller SSTables are merged into larger ones.
During this compaction process, if Cassandra encounters multiple versions of the same row, only the most recent version is written to the new SSTable. 
Subsequently, after compaction, Cassandra discards the original SSTables, thereby deleting the outdated rows.


In most Cassandra setups, replicas of each row are stored across two or more nodes. Each individual node conducts compaction independently.


# Resources

Below are some helpful resources for learning more about Apache Cassandra:

1. [Cassandra Basics - Official Apache Cassandra Documentation](https://cassandra.apache.org/_/cassandra-basics.html)

2. [Apache Cassandra 5.0 Features: Trie Memtables and Trie-Indexed SSTables - Official Cassandra Blog](https://cassandra.apache.org/_/blog/Apache-Cassandra-5.0-Features-Trie-Memtables-and-Trie-Indexed-SSTables.html)

3. [DataStax Documentation - Write and Update Operations in Cassandra 3.x](https://docs.datastax.com/en/cassandra-oss/3.x/cassandra/dml/dmlWriteUpdate.html)






