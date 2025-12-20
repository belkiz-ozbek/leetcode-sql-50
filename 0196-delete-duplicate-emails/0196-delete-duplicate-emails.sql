# Write your MySQL query statement below

DELETE p1
FROM Person p1
INNER JOIN Person p2
ON p1.email = p2.email AND p1.id > p2.id;

#p1.email = p2.email 
#| p1.id | email            | p2.id |
#| 1     | john@example.com | 1     |
#| 1     | john@example.com | 3     |
#| 2     | bob@example.com  | 2     |
#| 3     | john@example.com | 1     |
#| 3     | john@example.com | 3     |

#p1.email = p2.email AND p1.id > p2.id
#| 3     | john@example.com | 1     | DELETE THIS ROW!