DROP TABLE IF EXISTS weight_log_cleaned
CREATE TABLE weight_log_cleaned
(ID FLOAT, Date DATETIME2(7), Weightkg FLOAT)
INSERT INTO weight_log_cleaned
SELECT
	Id,
	Date,
	Weightkg
FROM 
	weightLogInfo

