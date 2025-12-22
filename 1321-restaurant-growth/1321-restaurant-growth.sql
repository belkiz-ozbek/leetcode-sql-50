# Write your MySQL query statement below

# Use Window Functions
-- AVG(value) OVER() belirli bir pencere içerisinde satır satır hesap yapar 
-- RANGE BETWEEN orn kullanım: bugünden 6 gün öncesine kadar..
-- ROWS BETWEEN satır sayısına göre pencere tanımlar | gün atlamaları varsa uygun değil.
-- BETWEEN A AND B 
-- 6 PRECEDING mevcut satırdan önceki 6 gün önceye kadar
-- 2 FOLLOWING mevcut satırdan sonraki
-- CURRENT ROW
-- INTERVAL 6 DAY 6 gün
-- INTERVAL 6 DAY PRECEDING en fazla 6 gün geride

WITH
Sum_Of_Amounts AS(
    SELECT visited_on, 
        SUM(amount) OVER(ORDER BY visited_on 
        RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) 
        AS amount
    FROM Customer 
)

# ilk 6 elemanı ekarte etme, Group By kullanımı
SELECT visited_on, amount, ROUND((amount / 7), 2) AS average_amount
FROM Sum_Of_Amounts
GROUP BY visited_on
ORDER BY visited_on ASC
LIMIT 18446744073709551615 OFFSET 6;


