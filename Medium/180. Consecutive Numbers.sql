QUESTION: https://leetcode.com/problems/consecutive-numbers/

APPROACH 1: USING 3 TIMES JOIN VERY SIMPLE LOGIC AND WORKS IN MYSQL

select distinct l1.num as 'ConsecutiveNums'
from
    Logs l1,
    Logs l2,
    Logs l3
where
    l1.id = 1+l2.id 
and
    l2.id = 1+ l3.id
and l1.num=l2.num
and l2.num = l3.num






APPROACH 2: WORKS IN SQL AND MS SQL SERVER

USING LAG AND WINDOW FUNCTION 
WE CAN PARTITION OR ORDER 
(NUM) MEANS IT GET THE VALUE OF NUM FROM PREV OR NEXT

SELECT DISTINCT num as ConsecutiveNums
FROM
(
SELECT num,LEAD(num) OVER(ORDER BY id) AS lead, LAG(num) OVER (ORDER BY id) AS lag
FROM logs
)t
WHERE num=lead and num=lag;
