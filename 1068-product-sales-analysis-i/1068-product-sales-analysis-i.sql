# Write your MySQL query statement below
SELECT product_name, year, price
FROM SALES S
INNER JOIN PRODUCT P ON S.product_id = P.product_id
