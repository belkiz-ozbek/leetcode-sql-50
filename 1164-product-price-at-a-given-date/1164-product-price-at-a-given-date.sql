# Write your MySQL query statement below
#sadece 2019-08-16 tarihinden önceki satırları çek.
#sonra en büyük tarihli değerleri seç

#part2 -----id'ye karşılık sayı yoksa 10 değerini ata
#belirtilen tarihin öncesinde olmayan product_id leri çek
#(products tablosunu elde edilen tablo ile joinle
#product_id'leri eşitle eğer herhangi bir değer hiç eşleşmiyorsa o satırdaki id'yi çek)
#hepsine 10 değerini ata.

SELECT p.product_id, p.new_price AS price
FROM Products p
INNER JOIN(
    SELECT product_id, MAX(change_date) AS max_date
    FROM Products
    WHERE change_date <= '2019-08-16' 
    GROUP BY product_id
) m ON p.product_id = m.product_id AND p.change_date = m.max_date  

UNION 

SELECT DISTINCT p.product_id, 10 AS price
FROM Products p
LEFT JOIN (
    SELECT product_id, new_price, change_date 
    FROM Products
    WHERE change_date <= '2019-08-16' 
) p3 ON p.product_id = p3.product_id
WHERE p3.product_id IS NULL

