-- Q1. If NULL values are present, update them with zeros for all columns
SELECT * FROM corona_virus WHERE
'Country/Region' IS NULL OR
Confirmed IS NULL OR
Deaths IS NULL OR
Recovered IS NULL OR 
'Active' IS NULL OR 
New_Cases IS NULL OR
New_Deaths IS NULL OR
New_Recovered IS NULL OR 
Confirmed_last_week IS NULL OR
One_week_change IS NULL OR
'WHO Region' IS NULL;
-- Q2. Check total number of rows
SELECT COUNT(*) FROM corona_virus;
-- Q3. Check what is start_date and end_date
SELECT MIN(`Date`) As Start_Date, MAX(`Date`) As End_Date FROM corona_virus;
-- Q4. Number of month present in dataset
	SELECT count(distinct substr(`Date`, 1, 7)) Month_Date FROM corona_virus;
-- Q5. Find monthly average for cofirmed, deaths, recovered per year
	SELECT distinct substr(`Date`, 1, 7) As Month_Date, round(Avg(Deaths), 2) Avg_Deaths, 
    round(Avg(Confirmed), 2) Avg_Confirmed, round(Avg(Recovered), 2) Avg_Recovered
    FROM corona_virus GROUP BY substr(`Date`, 1, 7) ;
-- Q6. Find minimum values for confirmed, deaths, recovered 
SELECT  distinct substr(`Date`, 1, 4) As Month_Date, MIN(Confirmed) Min_Confirm, 
MIN(Recovered) Min_Recovered, MIN(Deaths) Min_Deaths FROM corona_virus WHERE
confirmed != 0 AND Deaths != 0 AND Recovered != 0 
GROUP BY Month_Date ORDER BY Month_Date Desc;
-- Q7. Find maximum values for confirmed, deaths, recovered per year
SELECT  distinct substr(`Date`, 1, 4) As Month_Date, MAX(Confirmed) Max_Confirm, 
MAX(Recovered) Max_Recovered, MAX(Deaths) Max_Deaths FROM corona_virus WHERE
confirmed != 0 AND Deaths != 0 AND Recovered != 0 GROUP BY Month_Date 
ORDER BY Month_Date Desc;
-- Q8. The Total number of case of confirmed, deaths, recovered each Month
SELECT distinct substr(`Date`, 1, 7) As Month_Date, sum(Deaths) Total_Deaths, 
    round(Sum(Confirmed), 2) Total_Confirmed, round(Sum(Recovered), 2) Total_Recovered
    FROM corona_virus GROUP BY substr(`Date`, 1, 7) ORDER BY Month_Date DESC;
-- Q9. Find country having highest number of confirmed case
-- METHOD 1
SELECT `Country/Region` , SUM(Confirmed) FROM corona_virus GROUP BY `Country/Region` 
HAVING SUM(Confirmed) > 1 ORDER BY `Country/Region` DESC limit 3;
-- METHOD 2
SELECT `Country/Region` , SUM(Confirmed) Total_Confirmed FROM corona_virus 
GROUP BY `Country/Region` ORDER BY Total_Confirmed DESC limit 3;
-- METHOD 3
WITH TotalConfirmedCount As(
SELECT `Country/Region` As Country, SUM(Confirmed) As Total_Confirmed FROM 
corona_virus GROUP BY Country), TotalConfirmedRank As (SELECT *, RANK() 
OVER(ORDER BY Total_Confirmed DESC) As ranking FROM TotalConfirmedCount)
SELECT Country FROM TotalConfirmedRank WHERE ranking = 1; 



create view vie_db AS (SELECT * FROM corona_virus);