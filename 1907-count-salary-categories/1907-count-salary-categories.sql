# Write your MySQL query statement below
#ANOTHER SOLUTION - for optimization
SELECT "Low Salary" AS category, SUM(income < 20000) AS accounts_count
FROM Accounts
UNION ALL
SELECT "Average Salary" AS category, SUM(income >= 20000 AND income <= 50000) AS accounts_count
FROM Accounts
UNION ALL
SELECT "High Salary" AS category, SUM(income > 50000) AS accounts_count
FROM Accounts


#SELECT "Low Salary" AS category, COUNT(*) AS accounts_count
#FROM Accounts
#WHERE income < 20000
#
#UNION ALL
#
#SELECT "Average Salary" AS category, COUNT(*) AS accounts_count
#FROM Accounts
#WHERE income >= 20000 AND income <= 50000
#
#UNION ALL
#
#SELECT "High Salary" AS category, COUNT(*) AS accounts_count
#FROM Accounts
#WHERE income > 50000
