SELECT 
	SUM(VeryActiveMinutes) AS Veryactiveminutes,
	SUM(FairlyActiveMinutes) AS Fairlyactiveminutes,
	SUM(LightlyActiveMinutes) AS Lightlyactiveminutes,
	SUM(SedentaryMinutes) AS Sedentaryminutes
FROM daily_activity_cleaned

SELECT
	DISTINCT Id,
	SUM(Calories) OVER (PARTITION BY Id) AS calories,
	SUM(VeryActiveMinutes) OVER (PARTITION BY Id) AS veryactive
FROM daily_activity_cleaned
ORDER BY veryactive DESC;

SELECT
	DISTINCT Id,
	SUM(Calories) OVER (PARTITION BY Id) AS calories,
	SUM(FairlyActiveMinutes) OVER (PARTITION BY Id) AS fairlyactive
FROM daily_activity_cleaned
ORDER BY fairlyactive DESC;

SELECT
	DISTINCT Id,
	SUM(Calories) OVER (PARTITION BY Id) AS calories,
	SUM(LightlyActiveMinutes) OVER (PARTITION BY Id) AS lightlyactive
FROM daily_activity_cleaned
ORDER BY lightlyactive DESC;

SELECT
	DISTINCT Id,
	SUM(Calories) OVER (PARTITION BY Id) AS calories,
	SUM(SedentaryMinutes) OVER (PARTITION BY Id) AS sedentaryactive
FROM daily_activity_cleaned
ORDER BY sedentaryactive DESC;