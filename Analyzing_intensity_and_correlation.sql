-- Total time of each activity
SELECT 
	SUM(VeryActiveMinutes) AS Veryactiveminutes,
	SUM(FairlyActiveMinutes) AS Fairlyactiveminutes,
	SUM(LightlyActiveMinutes) AS Lightlyactiveminutes,
	SUM(SedentaryMinutes) AS Sedentaryminutes
FROM daily_activity_cleaned

-- Correlation between VeryActiveMinutes and Calories
SELECT
	DISTINCT Id,
	SUM(Calories) OVER (PARTITION BY Id) AS calories,
	SUM(VeryActiveMinutes) OVER (PARTITION BY Id) AS veryactive
FROM daily_activity_cleaned
ORDER BY veryactive DESC;

-- Correlation between FairlyActiveMinutes and Calories
SELECT
	DISTINCT Id,
	SUM(Calories) OVER (PARTITION BY Id) AS calories,
	SUM(FairlyActiveMinutes) OVER (PARTITION BY Id) AS fairlyactive
FROM daily_activity_cleaned
ORDER BY fairlyactive DESC;

-- Correlation between LightlyActiveMinutes and Calories
SELECT
	DISTINCT Id,
	SUM(Calories) OVER (PARTITION BY Id) AS calories,
	SUM(LightlyActiveMinutes) OVER (PARTITION BY Id) AS lightlyactive
FROM daily_activity_cleaned
ORDER BY lightlyactive DESC;

-- Correlation between SedentaryMinutes and Calories
SELECT
	DISTINCT Id,
	SUM(Calories) OVER (PARTITION BY Id) AS calories,
	SUM(SedentaryMinutes) OVER (PARTITION BY Id) AS sedentaryactive
FROM daily_activity_cleaned
ORDER BY sedentaryactive DESC;