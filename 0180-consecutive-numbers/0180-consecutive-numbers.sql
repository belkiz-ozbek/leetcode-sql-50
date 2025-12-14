# Write your MySQL query statement below
# ardışık en az 3 kere tekrar eden sayıları listele

SELECT DISTINCT l.num AS ConsecutiveNums
FROM Logs l
INNER JOIN Logs l2 ON l.id = l2.id + 1 
INNER JOIN Logs l3 ON l.id = l3.id + 2
WHERE l.num = l2.num AND l.num = l3.num


#| id | num |
#+----+-----+
#| 1  | 1   | | 2  | 1   | | 3  | 1   |
#| 2  | 1   | | 3  | 1   | | 4  | 2   |
#| 3  | 1   | | 4  | 2   | | 5  | 1   |
#| 4  | 2   | | 5  | 1   | | 6  | 2   |
#| 5  | 1   | | 6  | 2   | | 7  | 2   |
#| 6  | 2   | | 7  | 2   |
#| 7  | 2   |

#kıyas yapılacak satırların sayısı -> eleman sayısından 2 eksik 