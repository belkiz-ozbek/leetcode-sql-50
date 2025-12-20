# Write your MySQL query statement below

#duplicate satırları sil. 
#sell date'leri grupla

SELECT sell_date, COUNT(*) AS num_sold, GROUP_CONCAT(product ORDER BY product ASC SEPARATOR ',') AS products
FROM (SELECT DISTINCT sell_date, product FROM Activities) a
GROUP BY sell_date





#| sell_date  | product    |
#+------------+------------+
#| 2020-05-30 | Headphone  || Basketball || T-Shirt    |
#| 2020-06-01 | Pencil     || Bible      |
#| 2020-06-02 | Mask       |

