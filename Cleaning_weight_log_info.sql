DROP TABLE IF EXISTS weight_log_cleaned -- Drop weight_log_cleaned if it already exists in the database

-- Create a new table call weight_log_cleaned by importing data from weightLogInfo
CREATE TABLE weight_log_cleaned
(ID FLOAT, Date DATETIME2(7), Weightkg FLOAT)
INSERT INTO weight_log_cleaned
SELECT
	Id,
	Date,
	Weightkg
FROM 
	weightLogInfo

