/* Create a new table called daily_activity_cleaned in order to insert cleaned values into it. Some of the original values were imported as nvarchar instead of float,
which can't be used to execute calculations.*/

DROP TABLE IF EXISTS daily_activity_cleaned

CREATE TABLE daily_activity_cleaned 
(Id FLOAT, ActivityDate DATETIME2(7), TotalSteps INT, TotalDistance FLOAT, VeryActiveDistance FLOAT, ModeratelyActiveDistance FLOAT,
LightActiveDistance FLOAT, SedentaryActiveDistance FLOAT, VeryActiveMinutes INT, FairlyActiveMinutes INT, LightlyActiveMinutes INT,
SedentaryMinutes INT, Calories FLOAT) 

-- Insert new data into daily_activity_cleaned with the original data.
INSERT INTO daily_activity_cleaned
(Id, ActivityDate, TotalSteps, TotalDistance, VeryActiveDistance, ModeratelyActiveDistance, LightActiveDistance, SedentaryActiveDistance, VeryActiveMinutes,
FairlyActiveMinutes, LightlyActiveMinutes, SedentaryMinutes, Calories)

SELECT 
	Id,
	Activitydate,
	Totalsteps,
	CAST(TotalDistance AS FLOAT) AS TotalDistance,  -- The CAST function use to change the data type
	CAST(VeryActiveDistance AS FLOAT) AS VeryActiveDistance,
	CAST(ModeratelyActiveDistance AS FLOAT) AS ModeratelyActiveDistance,
	CAST(LightActiveDistance AS FLOAT) AS LightActiveDistance,
	CAST(SedentaryActiveDistance AS FLOAT) AS SedentaryActiveDistance,
	VeryActiveMinutes,
	FairlyActiveMinutes,
	LightlyActiveMinutes,
	SedentaryMinutes,
	Calories
FROM dailyActivity

