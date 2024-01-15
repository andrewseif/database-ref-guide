## NOTE: this is not the only DB as Airbnb and many of Airbnb-like architectures have a lot of use cases and many industries 
 
### Current DB Engine
- MySQL
### Why MySQL ?


     The decision to use MySQL's built-in replication to migrate the data for us meant that we no longer had to build the most challenging pieces to guarantee data consistency ourselves as replication was a proven quantity.
         Willie Yao, Airbnb Ex-Engineer 



- MySQL as Primary Database for Over 15 Years: Airbnb has consistently used MySQL as its core database system for more than a decade and a half.
- Initial Single Instance on EC2: In its early days, Airbnb's database setup involved a single MySQL instance running on Amazon's EC2 cloud infrastructure.
Data Consistency Challenges: According to a former Airbnb engineer, ensuring data consistency was a significant challenge they faced.
- MySQL's Built-in Replication to the Rescue: To address consistency concerns, Airbnb adopted MySQL's built-in replication feature. This decision eliminated the need to build custom consistency mechanisms, as MySQL's replication capabilities were already proven and reliable.


### Resources: 
- https://medium.com/airbnb-engineering/mysql-in-the-cloud-at-airbnb-336e5666bc94#.llrxogduu

- https://aws.amazon.com/solutions/case-studies/airbnb-case-study/#:~:text=In%20addition%2C%20Airbnb%20moved%20its,tasks%20typically%20associated%20with%20databases.

- https://www.mysql.com/customers/view/?id=1271