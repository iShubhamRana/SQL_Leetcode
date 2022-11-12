-- Question 67
-- Table: Products

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | new_price     | int     |
-- | change_date   | date    |
-- +---------------+---------+
-- (product_id, change_date) is the primary key of this table.
-- Each row of this table indicates that the price of some product was changed to a new price at some date.
 

-- Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

-- The query result format is in the following example:

-- Products table:
-- +------------+-----------+-------------+
-- | product_id | new_price | change_date |
-- +------------+-----------+-------------+
-- | 1          | 20        | 2019-08-14  |
-- | 2          | 50        | 2019-08-14  |
-- | 1          | 30        | 2019-08-15  |
-- | 1          | 35        | 2019-08-16  |
-- | 2          | 65        | 2019-08-17  |
-- | 3          | 20        | 2019-08-18  |
-- +------------+-----------+-------------+

-- Result table:
-- +------------+-------+
-- | product_id | price |
-- +------------+-------+
-- | 2          | 50    |
-- | 1          | 35    |
-- | 3          | 10    |
-- +------------+-------+
  
  
  SOLUTION: 
  find maax date for each product less than the required date and then left joni with the distinct product ids, this way we will have all the products 
  and their max date price or null
  then simply just select from them is null or rank is 1
    
   
    
  with t1 as (
	  select * ,
	   rank() over(partition by product_id order by change_date desc) as rk
	   from Products
	   where change_date <= '2019-08-16' 
	), 

	t2 as (
	select distinct product_id as product_id from Products
	)

	select product_id , coalesce(new_price,10) from
	t2 left join t1
	using(product_id)
	where rk is NULL or rk=1;
	
    
    
  
  
