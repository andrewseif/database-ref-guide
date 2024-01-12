### Previous DB Engine
- PostgreSQL
### Current DB Engine
- Schemaless [a DB sharding layer over MySQL]

### Why move from PostgreSQL to MySQL?
- Encountered challenges with write amplification, which occurs when updating a non-indexed column requires updating all other indexed columns as well. This is a design decision in PostgreSQL to implement MVCC (multi-version concurrency control) in a strict manner.
- Replication bugs that were in a previous PostgreSQL version 
- Connection Handling , MySQL which allowed Uber about 10,000 concurrent connections while PostgreSQL would surely have a much less number due to the overhead of creating a process-per-connection unlike MySQL's thread-per-connection[more expensive]

### Resources: 
- https://www.uber.com/en-EG/blog/postgres-to-mysql-migration/
- https://www.postgresql.org/docs/current/connect-estab.html#:~:text=PostgreSQL%20implements%20a%20%E2%80%9Cprocess%20per,time%20a%20connection%20is%20requested.

An eye-opening discussion about this architecture from Hussein Nasser: 
- https://www.youtube.com/watch?v=_E4315EbNI4