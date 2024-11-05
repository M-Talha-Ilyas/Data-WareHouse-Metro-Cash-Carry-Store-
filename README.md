# Data-WareHouse-Metro-Cash-Carry-Store
1. FIRST run Transactional _ MasterData Generator.sql file in some db schema.
2. run createDW.sql in schema named warehouse.
3. run MeshJoin.java which is in MeshJoin/src/warehouse/MeshJoin.java
4. The OLAP queries have been consolidated into a single file, named "olap_queries.sql", for streamlined analysis. This file encompasses a comprehensive set of queries designed to support multidimensional analysis of sales data. The queries cover every aspect of OLAP, including detailed breakdowns by quarter, allowing in-depth insights into sales trends and patterns across various time intervals and dimensions. Each query has been structured to address key business perspectives, enabling thorough exploration of metrics such as revenue, growth rates, regional performance, and product category comparisons. The consolidated approach ensures that all OLAP needs can be met efficiently, with easy access to a full range of sales-focused analytical perspectives.
