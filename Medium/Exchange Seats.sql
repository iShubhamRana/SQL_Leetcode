626. Exchange Seats

QUESTION : https://leetcode.com/problems/exchange-seats/


APPROACH 1:
WE CAN SIMPLY USE A CASE TO MANIPULATE THE VALUE WE SELECTED 

SELECT
    ( CASE
        WHEN MOD(id,2) !=0 AND counts != id THEN id+1
        WHEN MOD(id,2) !=0 AND counts = id THEN id
        ELSE id-1
     END )AS id , student
FROM
    seat, (
            SELECT 
                COUNT(*) AS counts
            FROM
                seat
          ) AS seat_counts
ORDER BY id ASC;


APROACH 2: 
  THE FORMULA GENERATES THE VALUE , BUT NOW WE NEED COLASCE HERE BECAUSE LAST VALUE WILL NOT BE MAPPED WITH ANYONE 
  COALESCE RETURNS THE FIRST NON NULL VALUE , THERFORE FOR LAST VALUE WE WILL HAVE S2.NAME AS NULL THEREFORE WE WILL HAVE S1 WHICH IS ITS NAME ITSELF  
  
  
SELECT
    s1.id, COALESCE(s2.student, s1.student) AS student
FROM
    seat s1
        LEFT JOIN
    seat s2 ON ((s1.id + 1) ^ 1) - 1 = s2.id
ORDER BY s1.id;
