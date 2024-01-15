## NOTE: this is not the only DB as Facebook and many of Faceook-like architectures have a lot of use cases and many industries 
 
### Current DB Engine
- MySQL
### Why MySQL ? [Switching from InnoDB to MyRocks]
- Facebook has been dependant on InnoDB Storage Engine for a long time but it had some inefficiencies in the write-optimized operations
- Mainly the problems focused on the fragmentation in pages when storing and compresing data and how the B-Tree structure handles writes .. So they decided to switch to make their own Storage Engine which used Append-Only [LSM] instead of B-Tree 


### Resources: 
- https://engineering.fb.com/2016/08/31/core-infra/myrocks-a-space-and-write-optimized-mysql-database/

### More details and Facebook's research paper:
- https://research.facebook.com/publications/myrocks-lsm-tree-database-storage-engine-serving-facebooks-social-graph/