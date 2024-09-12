SELECT * FROM virus_db.corona_virus1;
-- Beginner's Level:
-- Q1. What are the top 5 countries with the highest number of confirmed cases?
	SELECT `Country/Region`, Confirmed AS Confirmed_Cases FROM corona_virus1
    ORDER BY Confirmed DESC LIMIT 5;
-- Q2. Which WHO region has the highest number of total deaths?
	SELECT `WHO Region`, SUM(Deaths) AS Total_Deaths FROM corona_virus1
    GROUP BY `WHO Region` ORDER BY Total_Deaths DESC LIMIT 1;
-- Q3. How many new deaths were reported in the last week for each country/region?
    SELECT `Country/Region`, SUM(New_Deaths) AS New_Death_Report FROM corona_virus1 
    GROUP BY `Country/Region`;
-- Q4. What percentage of the confirmed cases are active cases for each country/region?
    SELECT `Country/Region`, ROUND((SUM(`Active`) / SUM(Confirmed)*100),2) AS 
    Percentage_Active_Cases FROM corona_virus1 GROUP BY `Country/Region`
    ORDER BY Percentage_Active_Cases DESC LIMIT 10;
-- Q5. Which WHO region has the highest number of recovered cases?
	SELECT * FROM corona_virus1;
    SELECT DISTINCT `WHO Region`, Recovered FROM corona_virus1 
    ORDER BY Recovered DESC LIMIT 1;
-- Q6. How does the total number of deaths this week compare to the total number of deaths last week for each country/region?
    SELECT `Country/Region`, SUM(Deaths) As Death_last_week, SUM(New_Deaths) As 
    Deaths_This_week, SUM(Deaths) - SUM(New_Deaths) As Death_Comparisons FROM 
    corona_virus1 GROUP BY `Country/Region` ORDER BY `Country/Region` DESC;
-- Q7. What is the total number of new cases reported in the last week across all countries/regions?
    SELECT `Country/Region`, SUM(New_Cases) As Total_Number_New_Cases FROM 
    corona_virus1 GROUP BY `Country/Region`;    
-- Q8. How many countries/regions reported zero new deaths this week?
    SELECT `Country/Region`, New_Deaths FROM corona_virus1 WHERE New_Deaths = 0;
    
-- Q9. Which WHO region has the lowest number of confirmed cases?
    SELECT `WHO Region`, MIN(Confirmed) FROM corona_virus1 WHERE Confirmed <
    (SELECT * FROM corona_virus1);
    #OR
	SELECT `WHO Region`, MIN(Confirmed) As Low_Confirmed_Cases FROM corona_virus1 
    GROUP BY `WHO Region` ORDER BY Low_Confirmed_Cases DESC;
-- Q10. What is the total number of recoveries for countries/regions with fewer than 1,000 confirmed cases?
    SELECT `Country/Region`, SUM(Recovered) As Total_No_Recoveries FROM corona_virus1
    WHERE Recovered < 1000 GROUP BY `Country/Region` ORDER BY Total_No_Recoveries DESC;
-- Q11.	What is the average number of new cases reported per country/region?
	SELECT DISTINCT `Country/Region`, ROUND(AVG(New_Cases), 2) AS Average_New_Cases FROM corona_virus1
    GROUP BY `Country/Region` ORDER BY Average_New_Cases DESC; 
-- Q12.	Which country/region experienced the largest increase in confirmed cases from last week to this week?
    SELECT `Country/Region`, SUM(Confirmed) - Sum(Confirmed_last_week) As Largest_Changed_Cases FROM 
    corona_virus1 GROUP BY `Country/Region` ORDER BY Largest_Changed_Cases DESC LIMIT 10;
-- Q13.	What is the total number of confirmed cases in the top 3 countries/regions 
	-- with the highest number of confirmed cases?
    SELECT `Country/Region`, SUM(Confirmed) As Confirmed_Cases FROM corona_virus1
    GROUP BY `Country/Region` ORDER BY Confirmed_Cases DESC LIMIT 3;
-- Q14.	Which country/region has the highest new recovery rate
    SELECT `Country/Region`, ROUND((SUM(New_Recovered) / SUM(Recovered)*100),2) AS
    Recovery_Rate FROM corona_virus1 GROUP BY `Country/Region` ORDER BY Recovery_Rate DESC LIMIT 1;
-- Q15.	Total Confirmed Cases by Country/Region
	SELECT * FROM corona_virus1;
    SELECT `Country/Region`, SUM(Confirmed) Total_Confirmed_Cases FROM corona_virus1
    GROUP BY `Country/Region` ORDER BY Total_Confirmed_Cases DESC;
-- Q16.	Total Deaths and Recoveries by WHO Region
    SELECT `WHO Region`, SUM(Deaths) AS Total_Deaths, SUM(Recovered) AS Total_Deaths 
    FROM corona_virus1 GROUP BY `WHO Region` ORDER BY Total_Deaths, Total_Deaths desc;
-- Q17.	Countries with the Highest Number of New Cases in the Last Week
    SELECT `Country/Region`, SUM(New_Cases) Highest_No_New_Cases FROM corona_virus1 
    GROUP BY `Country/Region` ORDER BY Highest_No_New_Cases DESC LIMIT 1;
-- Q18.	Countries with the Most Significant Change in Confirmed Cases Over the Past Week
    SELECT `Country/Region`, SUM(Confirmed_last_week) Confirmed_Past_Week FROM corona_virus1 
    GROUP BY `Country/Region` ORDER BY Confirmed_Past_Week DESC;
-- Q19.	Countries with the Highest Number of New Deaths
	SELECT `Country/Region`, SUM(New_Deaths) Most_Death_Cases FROM corona_virus1 
    GROUP BY `Country/Region` ORDER BY Most_Death_Cases DESC LIMIT 1;
-- Q20.	Percentage of Active Cases Compared to Confirmed Cases by Country/Region
    SELECT `Country/Region`, ROUND(SUM(`Active`) / SUM(Confirmed) * 100, 2) AS Percentage
    FROM corona_virus1 GROUP BY `Country/Region` ORDER BY Percentage DESC;
-- Q21. Recovery Rate by Country/Region
    SELECT `Country/Region`, ROUND(SUM(Recovered) / SUM(Confirmed) * 100, 2) AS Recovery_Rate
    FROM corona_virus1 GROUP BY `Country/Region` ORDER BY Recovery_Rate DESC;
-- Q22.	Weekly Change in Confirmed Cases for a Specific Country/Region
    SELECT `Country/Region`, SUM(One_week_change) AS Weekly_Change FROM 
    corona_virus1 GROUP BY `Country/Region` ORDER BY Weekly_Change DESC;
-- Q23.	Average New Cases and New Deaths by WHO Region
    SELECT `WHO Region`, ROUND(AVG(New_Cases), 2) Avg_New_Cases, ROUND(AVG(New_Deaths), 2) Avg_New_Deaths
    FROM corona_virus1 GROUP BY `WHO Region` ORDER BY Avg_New_Deaths;
-- Q24.	Countries with the Newest Recoveries
	SELECT * FROM corona_virus1;
    SELECT `Country/Region`, SUM(New_Recovered) Newest_Recoveries FROM corona_virus1 
    GROUP BY `Country/Region` ORDER BY Newest_Recoveries DESC;
-- Intermediate:
-- Q25.	What is the average number of new cases reported per country/region?
    SELECT `Country/Region`, ROUND(AVG(New_Cases),2) AS Avg_New_Cases FROM corona_virus1
    GROUP BY `Country/Region` ORDER BY Avg_New_Cases DESC;
-- Q26.	Which country/region experienced the largest increase in confirmed cases from last week to this week?
	SELECT `Country/Region`, SUM(Confirmed_last_week) AS Large_Increase FROM 
    corona_virus1 GROUP BY `Country/Region` ORDER BY Large_Increase DESC;
-- Q27.	What percentage of the confirmed cases are active cases for each country/region?
	SELECT * FROM CORONA_VIRUS1;
-- Q28.	What is the average number of deaths reported per WHO region?
-- Q29.	Which country/region has the highest number of active cases?
-- Q30.	What is the total number of new deaths reported by each WHO region?
