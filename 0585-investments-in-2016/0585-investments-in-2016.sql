# Write your MySQL query statement below
# have the same tiv_2015 value as one or more other policyholders
-- ANOTHER SOLUTION -- IMPROVED
WITH Same_Tiv_2015 AS(
    SELECT *,
           COUNT(*) OVER(PARTITION BY tiv_2015) AS tiv_count,
           COUNT(*) OVER(Partition BY lat, lon) AS location_count
    FROM Insurance
)
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Same_Tiv_2015
WHERE tiv_count > 1 AND location_count = 1;

#+-----+----------+----------+-----+-----+----------+---------------+ 
#| pid | tiv_2015 | tiv_2016 | lat | lon | tiv_count| location_count|
#+-----+----------+----------+-----+-----+----------+---------------+ 
#| 1   | 10       | 5        | 10  | 10  | 3        | 1
#| 2   | 20       | 20       | 20  | 20  | 1        | 2
#| 3   | 10       | 30       | 20  | 20  | 3        | 2
#| 4   | 10       | 40       | 40  | 40  | 3        | 1


-- FIRST SOLUTION
#WITH
#Tekrar_Eden_Tiv_2015_Degerleri AS(
#    SELECT tiv_2015
#    FROM Insurance
#    GROUP BY tiv_2015
#    HAVING COUNT(*) > 1
#),
#tiv_2025 değeri tekrar eden tüm satırları çek - JOIN uygula
#Tekrar_Eden_Tiv_2015_Degerleri_Detayli_Tablo AS(
#SELECT i.pid, i.tiv_2015, tiv_2016, lat, lon
#FROM Insurance i
#JOIN Tekrar_Eden_Tiv_2015_Degerleri t
#ON i.tiv_2015 = t.tiv_2015
#),
#Lin_Lon_Cifti_Ayni_Olan_Degerler AS(
#SELECT td.pid, i.tiv_2015, i.tiv_2016, i.lat, i.lon
#FROM Tekrar_Eden_Tiv_2015_Degerleri_Detayli_Tablo td
#JOIN Insurance i
#ON td.lat = i.lat AND td.lon = i.lon AND td.pid != i.pid
#)
#
#SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
#FROM Tekrar_Eden_Tiv_2015_Degerleri_Detayli_Tablo t
#WHERE NOT EXISTS(
#    SELECT *
#    FROM Lin_Lon_Cifti_Ayni_Olan_Degerler l
#    WHERE t.pid = l.pid
#)


#|pid| tiv_2015 | tiv_2016 | lat | lon |
#|---| -------- | -------- | --- | --- |
#|1  | 10       | 5        | 10  | 10  |
#|3  | 10       | 30       | 20  | 20  |
#|4  | 10       | 40       | 40  | 40  |

# lat, lon değeri unique olan satırları çek. 
# tiv_2016 değerlerini topla

