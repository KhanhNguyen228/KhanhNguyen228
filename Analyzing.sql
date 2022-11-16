-- Calculate the number of users who track their physical activities; the average number of steps, distance traveled, and calories consumed. 
SELECT
	COUNT (DISTINCT Id) AS num_of_users_phy,
	SUM(TotalSteps) AS sum_steps,
	AVG(TotalSteps) AS avg_steps,
	ROUND(AVG(TotalDistance),2) AS avg_distance,
	AVG(Calories) AS avg_calories
FROM
	daily_activity_cleaned

-- Calculate the number of users who track their heart rate and the average, maximum, and minimum values of heart rate.
SELECT 
	COUNT (DISTINCT Id) AS num_of_users_heart,
	AVG(value) AS avg_heartrate,
	MAX(value) AS max_heartrate,
	MIN(value) AS min_heartrate
FROM
	heartrate_seconds

-- Calculate the number of users who monitor their sleep pattern and the average, maximum, and minimum values related to sleep.
SELECT 
	COUNT (DISTINCT Id) AS num_of_users_sleep,
	AVG(TotalMinutesAsleep)/60 AS avg_hour_asleep,
	MAX(TotalMinutesAsleep)/60 AS max_hour_asleep,
	MIN(TotalMinutesAsleep)/60 AS min_hour_asleep,
	AVG(TotalTimeInBed)/60 AS avg_hour_inbed
FROM
	sleepDay

-- Calculate the number of users who track their weight and the average, maximun, and minimum values related to weight.
SELECT
	COUNT (DISTINCT Id) AS num_of_users_weight,
	AVG(WeightKg) AS avg_weight,
	MAX(WeightKg) AS max_weight,
	MIN(WeightKg) AS min_weight
FROM weight_log_cleaned

-- Calculate the number of days each user tracked physical activity
SELECT 
	DISTINCT Id, 
	COUNT(ActivityDate) OVER (PARTITION BY Id) AS days_activity_recorded
FROM daily_activity_cleaned
ORDER BY days_activity_recorded DESC

-- Calculate average minutes for each activity
SELECT
	AVG(days_activity_recorded) AS days_activity_recorded,
	AVG(VeryActiveMinutes) AS avg_very_activemin,
	AVG(FairlyActiveMinutes) AS avg_fairly_activemin,
	ROUND(AVG(LightlyActiveMinutes)/60,2) AS avg_lightly_activehour,
	ROUND(AVG(SedentaryMinutes)/60,2) AS avg_sedentary_hour,
	ROUND((SELECT
		(SUM(VeryActiveMinutes) + SUM(FairlyActiveMinutes)+ SUM(LightlyActiveMinutes) + SUM(SedentaryMinutes))/COUNT(daily_activity_cleaned.Id)
	FROM daily_activity_cleaned)/60, 2) AS AverageHoursDeviceUsed

FROM daily_activity_cleaned 

JOIN tracked_days
	ON daily_activity_cleaned.Id = tracked_days.Id -- Inner join to merge daily_activity_cleaned & tracked_days


-- Determine time when users were most active
SELECT
	DISTINCT (CAST(ActivityHour AS TIME)) AS activity_time,
	AVG(TotalIntensity) OVER (PARTITION BY DATEPART(Hour, ActivityHour)) AS avg_intensity,
	AVG(METs/10.0) OVER (PARTITION BY DATEPART(Hour, ActivityHour)) AS avg_mets

FROM hourly_activity

JOIN minuteMETsNarrow AS METs
	ON hourly_activity.Id = METs.Id AND
	   hourly_activity.ActivityHour = METs.ActivityMinute

ORDER BY avg_intensity DESC;
