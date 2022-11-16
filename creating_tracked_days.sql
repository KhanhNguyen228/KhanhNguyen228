DROP TABLE IF EXISTS tracked_days
-- Create tracked_days to show the number of days each user tracked his/her physical activity
CREATE TABLE tracked_days
	(Id FLOAT, days_activity_recorded INT)
INSERT INTO tracked_days

SELECT
	DISTINCT Id,
	COUNT(ActivityDate) OVER (PARTITION BY Id) AS days_activity_recorded
FROM dailyActivity
ORDER BY days_activity_recorded DESC

SELECT * FROM tracked_days
ORDER BY days_activity_recorded DESC