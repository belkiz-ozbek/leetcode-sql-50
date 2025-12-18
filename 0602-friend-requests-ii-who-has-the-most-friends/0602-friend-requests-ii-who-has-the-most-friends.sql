WITH 
IDs AS(
    SELECT DISTINCT id
    FROM (
        SELECT DISTINCT requester_id AS id
        FROM RequestAccepted
        UNION ALL
        SELECT DISTINCT accepter_id AS id
        FROM RequestAccepted
    ) i
),
Friends_Number AS(
    SELECT id, COUNT(*) AS friends_number
    FROM IDs i
    INNER JOIN RequestAccepted r
    ON i.id = r.requester_id
    GROUP BY id
    UNION ALL
    SELECT id, COUNT(*)
    FROM IDs i
    INNER JOIN RequestAccepted a
    ON i.id = a.accepter_id
    GROUP BY id
),
Friends_Number_With_Grouping AS(
    SELECT id, SUM(friends_number) AS num
    FROM Friends_Number
    GROUP BY id
)

SELECT id, num
FROM Friends_Number_With_Grouping
WHERE num = (SELECT MAX(num) FROM
                (SELECT id, num
                FROM Friends_Number_With_Grouping) fng
            )