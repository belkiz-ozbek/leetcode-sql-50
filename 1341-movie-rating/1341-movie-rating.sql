# Write your MySQL query statement below

WITH 
Rating_Number AS(
    SELECT name, COUNT(*) AS rating_number
    FROM MovieRating mr
    JOIN Users u
    ON mr.user_id = u.user_id 
    GROUP BY mr.user_id
),
Max_Rating_Number AS(
    SELECT name, rating_number   
    FROM Rating_Number
    WHERE rating_number = (SELECT MAX(rating_number) FROM Rating_Number)
),
Avg_Rating AS(
    SELECT title, AVG(rating) AS avg_rating
    FROM MovieRating mr
    INNER JOIN  Movies m
    ON mr.movie_id = m.movie_id
    WHERE created_at >= '2020-02-01' AND created_at < '2020-03-01'
    GROUP BY m.title
),
Max_Avg_Rating AS(
    SELECT title, avg_rating
    FROM Avg_Rating
    WHERE avg_rating = (
        SELECT MAX(avg_rating)
        FROM Avg_Rating
    )
)

SELECT name AS results
FROM Max_Rating_Number
WHERE name = (
    SELECT MIN(name) 
    FROM Max_Rating_Number
    )


UNION ALL

SELECT title AS results
FROM Max_Avg_Rating
WHERE title = (
    SELECT MIN(title) 
    FROM Max_Avg_Rating
    )