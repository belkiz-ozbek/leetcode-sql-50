#ANOTHER SOLUTION
WITH
Friend_Relations AS(
    SELECT 
    requester_id AS id,
    accepter_id AS friend_id
    FROM RequestAccepted
    
    UNION ALL
    
    SELECT 
        accepter_id AS id,
        requester_id AS friend_id
    FROM RequestAccepted
),
Friend_Counts AS(
    SELECT id, COUNT(DISTINCT friend_id) AS friend_counts
    FROM Friend_Relations
    GROUP BY id
)

SELECT id, friend_counts AS num
FROM Friend_Counts 
WHERE friend_counts = (SELECT MAX(friend_counts) FROM Friend_Counts)






#WITH 
#IDs AS(
#    SELECT DISTINCT id
#    FROM (
#        SELECT DISTINCT requester_id AS id FROM RequestAccepted
#        UNION ALL
#        SELECT DISTINCT accepter_id AS id FROM RequestAccepted
#    ) i
#    
#),
#Friends_Number AS(
#    SELECT id, COUNT(*) AS friends_number
#    FROM IDs i
#    INNER JOIN RequestAccepted r
#    ON i.id = r.requester_id
#    GROUP BY id
#    UNION ALL
#    SELECT id, COUNT(*)
#    FROM IDs i
#    INNER JOIN RequestAccepted a
#    ON i.id = a.accepter_id
#    GROUP BY id
#),
#Friends_Number_With_Grouping AS(
#    SELECT id, SUM(friends_number) AS num
#    FROM Friends_Number
#    GROUP BY id
#)
#
#SELECT id, num
#FROM Friends_Number_With_Grouping
#WHERE num = (SELECT MAX(num) FROM
#                (SELECT id, num
#                FROM Friends_Number_With_Grouping) fng
#            )
#