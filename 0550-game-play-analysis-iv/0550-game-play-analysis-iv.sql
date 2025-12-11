# Write your MySQL query statement below

#another solution
SELECT ROUND(
        COUNT(*) / (SELECT COUNT(DISTINCT player_id)
                                    FROM Activity), 2) AS fraction
FROM Activity a2
INNER JOIN (
        SELECT player_id, MIN(event_date) AS event_date
        FROM Activity
        GROUP BY player_id
) d ON a2.player_id = d.player_id  
    AND a2.event_date != d.event_date
WHERE DATEDIFF(a2.event_date, d.event_date) = 1


#SELECT ROUND(
#        COUNT(*) / (SELECT COUNT(DISTINCT player_id)
#                                    FROM Activity), 2) AS fraction
#FROM Activity a2
#INNER JOIN (
#        SELECT a.player_id, a.event_date
#        FROM Activity a
#        INNER JOIN (SELECT player_id, MIN(event_date) AS initial_date
#        FROM Activity
#        GROUP BY player_id
#    ) m ON a.player_id = m.player_id AND a.event_date = m.initial_date
#) d ON a2.player_id = d.player_id  
#    AND a2.event_date != d.event_date
#WHERE DATEDIFF(a2.event_date, d.event_date) = 1

