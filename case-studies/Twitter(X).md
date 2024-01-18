# Twitter's Database Architecture

## MySQL (Initial Foundation):
- Twitter's primary database for storing all data, including tweets, user profiles, and relationships.

## Gizzard (Sharded MySQL for Tweets):
- Built on top of MySQL to specifically address tweet storage and scalability.
- Sharded MySQL across multiple servers to distribute tweet data.

**Sharding:** 
- A technique used to partition data across multiple databases or nodes (shards) to distribute the workload and improve performance and scalability.

## Cassandra (Around 2010):
- Around 2010, Twitter added Cassandra as a storage solution.
- While Cassandra didn't fully replace MySQL due to its lack of an auto-increment feature, it gained adoption as a metrics store.

## Manhattan (Around 2014):
- MySQL & Manhattan are the primary data stores for storing user data.
- Twitter started using Manhattan as a replacement for some of its MySQL storage needs, especially in scenarios that required real-time, high-write, and low-latency capabilities.
- Manhattan is a distributed storage system developed by Twitter, specifically designed to address the challenges posed by the high-volume and real-time nature of Twitter's data.
- Manhattan offers features like automatic sharding, multi-tenancy support, and real-time indexing, making it well-suited for applications where rapid data retrieval and low-latency access are crucial. It is designed to handle the high write loads that platforms like Twitter experience due to the constant creation of tweets, retweets, and other user interactions.

## Hadoop (Today):
- Used to store data for running analytics on the actions the users perform on the platform.
- Applications include social graph analysis, trends analysis, API analytics, ad targeting, ad analytics, and tweet impressions processing.

**Resources:**
- [How Twitter Stores 250 Million Tweets a Day Using MySQL](http://highscalability.com/blog/2011/12/19/how-twitter-stores-250-million-tweets-a-day-using-mysql.html)
- [What Database Does Twitter Use? A Deep Dive](https://scaleyourapp.com/what-database-does-twitter-use-a-deep-dive/)
- [Infrastructure Behind Twitter Storage](https://www.linkedin.com/pulse/infrastructure-behind-twitter-storage-gaurav-singh-shekhawat/)
