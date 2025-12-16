# Write your MySQL query statement below
# öncelikle salary kontrolünü yap
# manager id employee_id'de var mı kontrol et. yoksa employee_id yazdır.

SELECT s.employee_id
FROM (  
    SELECT employee_id, manager_id
    FROM Employees
    WHERE salary < 30000 AND manager_id IS NOT NULL
    ) s
LEFT JOIN Employees e ON s.manager_id = e.employee_id
WHERE e.employee_id IS NULL
ORDER BY s.employee_id;


