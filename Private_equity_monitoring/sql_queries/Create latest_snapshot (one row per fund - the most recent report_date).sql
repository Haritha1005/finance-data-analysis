USE pe_portfolio;

DROP TABLE IF EXISTS latest_snapshot;
CREATE TABLE latest_snapshot AS
SELECT *
FROM (
  SELECT fs.*,
         ROW_NUMBER() OVER (PARTITION BY assigned_unid ORDER BY report_date DESC) AS rn
  FROM pe_data fs
) t
WHERE rn = 1;
SELECT * FROM latest_snapshot
limit 10;