# Write your MySQL query statement below
# + -> en az bir tane olmalı. BOŞ OLAMAZ!
# [] -> içerisindekilerden herahngi biri olabilir. 
# [a-zA-Z0-9_.-]+ -> domain adı
SELECT user_id, name, mail
FROM Users
WHERE REGEXP_LIKE(mail, '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com$','c') 
