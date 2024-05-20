-- Customer Who Visited but Did Not Make Any Transactions


/* Question 8

Table: Visits

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| visit_id    | int     |
| customer_id | int     |
+-------------+---------+
visit_id is the column with unique values for this table.
This table contains information about the customers who visited the mall.
 

Table: Transactions

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| transaction_id | int     |
| visit_id       | int     |
| amount         | int     |
+----------------+---------+
transaction_id is column with unique values for this table.
This table contains information about the transactions made during the visit_id.
 

Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

Return the result table sorted in any order.

The result format is in the following example.

solution :-> */

-- Using Join
select v.customer_id, count(v.visit_id) as count_no_trans
from Visits as v
left join Transactions as t
on v.visit_id = t.visit_id
where t.transaction_id is null
group by v.customer_id; 

-- Using subqueries
select customer_id , count(*) as count_no_trans
from Visits 
where visit_id not in(select visit_id from transactions)
group by customer_id