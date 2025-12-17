# Write your MySQL query statement below

#customer_id'ler kaç defa tekrar ediyor 
SELECT customer_id
FROM (
    SELECT customer_id, COUNT(*) AS customer_id_tekrar_sayisi
    FROM (
        SELECT DISTINCT *
        FROM Customer
    ) c2
    GROUP BY customer_id
    ) c
WHERE customer_id_tekrar_sayisi = 
(
    #kaç farklı product_id var
    SELECT COUNT(*)
    FROM Product
) 


