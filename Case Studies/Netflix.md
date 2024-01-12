## NOTE: this is not the only DB as Netflix and many of Netflix-like architectures have a lot of use cases and many industries 
 
### Previous DB Engine
- Cassandra
### Current DB Engine
- CockroachDB
### Why move from Cassandra to CockroachDB?
- Changes in the Netflix Industry as they needed to handle a lot more than they previously used to in 2016 so they had to find solutions for :
    - Cloud Drive
    - CDNs
- Cassandra's consistency level was not strict [eventual consistency] and consistency had become very necessary as well as the transactions which were not supported in Cassandra so they decided to go for a relational model to fix these issues

- ## CockroachDB vs. Other Options
| Feature | CockroachDB | AWS DynamoDB | AWS Aurora |
|---|---|---|---|
| Multi-active topology | ✔ | Single-region writer | Single-region writer |
| Global consistent secondary indices | ✔ | Eventually consistent | Eventually consistent |
| Global reads | ✔ | Single-region only | Single-region only |
| Full control of the system | ✔ (on-premise) | Limited | Limited |
| SQL | ✔ | No | Yes |

- Key Reasons for Choosing CockroachDB:

    - Open-Source and Customizable: Netflix, being an open-source champion, valued the ability to run and modify CockroachDB according to their specific needs and infrastructure.
    - Multi-Active Topology: Unlike single-region writer setups, CockroachDB enables reads and writes from any node in the cluster, boosting high availability and guaranteeing strong consistency across data replicas.
    - Excellent Transaction Support: CockroachDB excels at handling complex transactions and maintaining data consistency even in the face of failures or network disruptions.


### Resources: 
- Video: Journey of CockroachDB at Netflix | History of databases at Netflix - https://www.youtube.com/watch?v=7tnIcs-pi4k