# Write your MySQL query statement below
# have the same tiv_2015 value as one or more other policyholders


WITH
Tekrar_Eden_Tiv_2015_Degerleri AS(
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
),
#tiv_2025 değeri tekrar eden tüm satırları çek - JOIN uygula
Tekrar_Eden_Tiv_2015_Degerleri_Detayli_Tablo AS(
SELECT i.pid, i.tiv_2015, tiv_2016, lat, lon
FROM Insurance i
JOIN Tekrar_Eden_Tiv_2015_Degerleri t
ON i.tiv_2015 = t.tiv_2015
),
Lin_Lon_Cifti_Ayni_Olan_Degerler AS(
SELECT td.pid, i.tiv_2015, i.tiv_2016, i.lat, i.lon
FROM Tekrar_Eden_Tiv_2015_Degerleri_Detayli_Tablo td
JOIN Insurance i
ON td.lat = i.lat AND td.lon = i.lon AND td.pid != i.pid
)

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Tekrar_Eden_Tiv_2015_Degerleri_Detayli_Tablo t
WHERE NOT EXISTS(
    SELECT *
    FROM Lin_Lon_Cifti_Ayni_Olan_Degerler l
    WHERE t.pid = l.pid
)


#|pid| tiv_2015 | tiv_2016 | lat | lon |
#|---| -------- | -------- | --- | --- |
#|1  | 10       | 5        | 10  | 10  |
#|3  | 10       | 30       | 20  | 20  |
#|4  | 10       | 40       | 40  | 40  |

# lat, lon değeri unique olan satırları çek. 
# tiv_2016 değerlerini topla

