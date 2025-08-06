-- Q1.Top 5 Crops by Average Yield per State
-- This query calculates average yield for each State-Crop pair
-- and selects the top 5 combinations with the highest yield.
SELECT State, Crop, AVG(Yield) AS Avg_Yield  
FROM `crop_yield (1)`  
GROUP BY State, Crop  
ORDER BY Avg_Yield DESC  
LIMIT 5;

-- Q2: States with Highest Production Growth between 2010 and 2020
-- NULLIF is used to avoid division by zero errors.
SELECT State,
       SUM(CASE WHEN Crop_Year = 2010 THEN Production ELSE 0 END) AS Prod_2010,
       SUM(CASE WHEN Crop_Year = 2020 THEN Production ELSE 0 END) AS Prod_2020,
-- This query compares production values from 2010 and 2020
-- and calculates the percentage growth for each state.
       ROUND(
           (1.0 * SUM(CASE WHEN Crop_Year = 2020 THEN Production ELSE 0 END) -
           SUM(CASE WHEN Crop_Year = 2010 THEN Production ELSE 0 END)) /
           NULLIF(SUM(CASE WHEN Crop_Year = 2010 THEN Production ELSE 0 END), 0) * 100,
-- Growth_Percent name given to final result which shows percentage growth between 2010 and 2020
       2) AS Growth_Percent
FROM `crop_yield (1)`
GROUP BY State
ORDER BY Growth_Percent DESC
LIMIT 5;

