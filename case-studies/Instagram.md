# Instagram Database and Storage Architecture

## Databases and Storage:

- **PostgreSQL:**
  Instagram uses PostgreSQL as one of its primary databases to store various types of data, including user information and posts.

- **Cassandra:**
  To handle the massive scale and high throughput of data, Instagram employs Cassandra, a distributed NoSQL database, for certain operations.

- **Redis:**
  Instagram uses Redis for caching frequently accessed data, which helps improve the platform's performance and response times.

## Storage:

Instagram mainly uses two backend database systems:

- **PostgreSQL and Cassandra:**
  Both PostgreSQL and Cassandra have mature replication frameworks that work well as a globally consistent data store. The goal is to have eventual consistency of these data across data centers, but with potential delay.

  Because there are vastly more read than write operations, having read replica each region avoids cross data center reads from web servers. Writing to PostgreSQL, however, still goes across data centers because they always write to the primary.

- **Postgres -> Handle Writing in Instagram**
- **Cassandra -> Handle Reading in Instagram**

**Important Note:**
Both PostgreSQL and Cassandra are capable of handling both read and write operations. However, the design decisions and strategies mentioned in the passage suggest that read replicas in each region, likely using Cassandra, are used to address the high.
## Sourse


[Instagration Pt. 2: Scaling Our Infrastructure to Multiple Data Centers](https://instagram-engineering.com/instagration-pt-2-scaling-our-infrastructure-to-multiple-data-centers-5745cbad7834)



[Threads: Instagram, TikTok, Top Social Media Apps, and What Technologies Stand Behind Them](https://codegym.cc/groups/posts/18412-threads-instagram-tiktok-top-social-media-apps-and-what-technologies-stand-behind-them)
