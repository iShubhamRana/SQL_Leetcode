-- Question 80
-- Table: Logs

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | log_id        | int     |
-- +---------------+---------+
-- id is the primary key for this table.
-- Each row of this table contains the ID in a log Table.

-- Since some IDs have been removed from Logs. Write an SQL query to find the start and end number of continuous ranges in table Logs.

-- Order the result table by start_id.

-- The query result format is in the following example:

-- Logs table:
-- +------------+
-- | log_id     |
-- +------------+
-- | 1          |
-- | 2          |
-- | 3          |
-- | 7          |
-- | 8          |
-- | 10         |
-- +------------+

-- Result table:
-- +------------+--------------+
-- | start_id   | end_id       |
-- +------------+--------------+
-- | 1          | 3            |
-- | 7          | 8            |
-- | 10         | 10           |
-- +------------+--------------+
-- The result table should contain all ranges in table Logs.
-- From 1 to 3 is contained in the table.
-- From 4 to 6 is missing in the table
-- From 7 to 8 is contained in the table.
-- Number 9 is missing in the table.
-- Number 10 is contained in the table.



OPTIMAL APPROACH:
see since consecutive elements always occur in order , so they will also shift in a group
So the actual position - the position assigned i same for a group

4 5 6   elements
8 9 10  row     8-4 = 9-5 = 10-6

select min(log_id) as start_id, max(log_id) as end_id
from(
select log_id, log_id-row_number() over (order by log_id) as rk
from logs) a
group by rk




ANOTHER APPROACH:

with t1 as (
select log_id as start_id,
rank() over(order by log_id) as rk from logs
where log_id-1 not in( select * from logs)
), 

t2 as (
select log_id as end_id,
rank() over(order by log_id) as rk from logs
where log_id+1 not in( select * from logs)
)

select start_id , end_id 
from t1 inner join t2
using(rk)














