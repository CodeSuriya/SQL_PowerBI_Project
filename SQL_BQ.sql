
create database Crimes_On_Womens
 
 use Crimes_On_Womens
 show tables
 
 select * from crimesonwomendata
 select * from crimesonwomendata limit 10
 
 
 
 
 select State,Year,(Rape + `K&A` + DD + AoW + AoM + DV + WT) as Total_Crimes
 from crimesonwomendata 
 order by 
 Total_crimes desc
 limit 3
 
 
 
 

 
 
 
  select distinct state from crimesonwomendata
  
  
 select count(distinct state) as distinct_count_state from crimesonwomendata
 
 SELECT 
    Year, 
    SUM(Rape + `K&A` + DD + AoW + AoM + DV + WT) AS Total_Crimes
FROM 
    CrimesOnWomenData
GROUP BY 
    Year
ORDER BY 
    Year desc
limit 5









SELECT 
    State,
    CASE 
        WHEN MAX(Rape) >= MAX(`K&A`) AND MAX(Rape) >= MAX(DD) AND MAX(Rape) >= MAX(AoW) AND MAX(Rape) >= MAX(AoM) AND MAX(Rape) >= MAX(DV) AND MAX(Rape) >= MAX(WT) THEN 'Rape'
        WHEN MAX(`K&A`) >= MAX(Rape) AND MAX(`K&A`) >= MAX(DD) AND MAX(`K&A`) >= MAX(AoW) AND MAX(`K&A`) >= MAX(AoM) AND MAX(`K&A`) >= MAX(DV) AND MAX(`K&A`) >= MAX(WT) THEN 'Kidnapping and Abduction'
        when max(DD) >= max(Rape) and max(DD) >= max(`K&A`) and max(DD) >= max(AoW) and max(DD) >= max(AoM) and max(DD) >= max(DV)  and max(DD) >= max(WT) then 'Dowry Death'
        when max(AoW) >= max(Rape) and max(AoW) >= max(`K&A`) and  max(AoW) >= max(DD) and max(AoW) >= max(AoM)  and max(AoW) >= max(DV) and max(AoW) >= max(WT) then 'Assault on women case'
        when max(AoM) >= max(Rape) and max(AoM) >= max(`K&A`) and  max(AoM) >= max(DD) and max(AoM) >= max(AoW)  and max(AoM) >= max(DV) and max(AoM) >= max(WT) then 'Assault on minor case'
        when max(DV) >= max(Rape) and max(DV) >= max(`K&A`) and  max(DV) >= max(DD) and max(DV) >= max(AoW)  and max(DV) >= max(AoM) and max(DV) >= max(WT) then 'Domestic Violence'
        when max(WT) >= max(Rape) and max(WT) >= max(`K&A`) and  max(WT) >= max(DD) and max(WT) >= max(AoW)  and max(WT) >= max(AoM) and max(WT) >= max(DV) then 'women trafficking'

        ELSE 'Other'
    END AS Most_Frequent_Crime_Type
FROM 
    CrimesOnWomenData
GROUP BY 
    State;



SELECT 
    State, 
    SUM(Rape) AS Total_Rape_Cases
FROM 
    CrimesOnWomenData
GROUP BY 
    State
ORDER BY 
    Total_Rape_Cases DESC
limit 5




SELECT 
    State, 
    Year, 
    DV AS Domestic_Violence_Cases
FROM 
    CrimesOnWomenData
ORDER BY 
    State,
    Year;





SELECT 
    Year, 
    SUM(Rape + `K&A` + DD + AoW + AoM + DV + WT) AS Total_Crimes
FROM 
    CrimesOnWomenData
GROUP BY 
    Year
ORDER BY 
    Total_Crimes DESC
LIMIT 1;







SELECT 
    State, 
    SUM(Rape) AS Total_Rape, 
    SUM(`K&A`) AS Total_Kidnapping_Abduction,
    SUM(DD) AS Total_Dowry_Deaths,
    SUM(AoW) AS Total_Assault_on_Women,
    SUM(AoM) AS Total_Assault_on_Minors,
    SUM(DV) AS Total_Domestic_Violence,
    SUM(WT) AS Total_Trafficking
FROM 
    CrimesOnWomenData
GROUP BY 
    State



SELECT 
    Year, 
    SUM(AoW) AS Total_Assault_on_Women, 
    SUM(AoM) AS Total_Assault_on_Minors
FROM 
    CrimesOnWomenData
GROUP BY 
    Year
ORDER BY 
    Year;




SELECT 
    State, 
    Year, 
    SUM(`K&A`) AS Total_Kidnapping_Abduction_Cases
FROM 
    CrimesOnWomenData
GROUP BY 
    State, Year
ORDER BY 
    State, Year;





SELECT 
    State, 
    SUM(Rape) AS Total_Rape, 
    SUM(`K&A`) AS Total_Kidnapping_Abduction, 
    SUM(DD) AS Total_Dowry_Deaths, 
    SUM(AoW) AS Total_Assault_on_Women, 
    SUM(AoM) AS Total_Assault_on_Minors, 
    SUM(DV) AS Total_Domestic_Violence
FROM 
    CrimesOnWomenData
WHERE 
    WT = 0
GROUP BY 
    State;
    
