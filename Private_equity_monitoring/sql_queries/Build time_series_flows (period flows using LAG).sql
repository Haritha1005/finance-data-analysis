USE pe_portfolio;

DROP TABLE IF EXISTS time_series_flows;
CREATE TABLE time_series_flows AS
SELECT
  fs.assigned_unid,
  fs.fund_name,
  fs.report_date,
  fs.initial_investment_date,
  fs.contributions AS cumulative_contributions,
  fs.distributions AS cumulative_distributions,
  fs.current_market_value,
  fs.total_value,
  COALESCE(fs.contributions - LAG(fs.contributions) OVER (PARTITION BY fs.assigned_unid ORDER BY fs.report_date), 0) AS capital_called_in_period,
  COALESCE(fs.distributions - LAG(fs.distributions) OVER (PARTITION BY fs.assigned_unid ORDER BY fs.report_date), 0) AS distributions_in_period,
  COALESCE(fs.total_value - LAG(fs.total_value) OVER (PARTITION BY fs.assigned_unid ORDER BY fs.report_date), 0) AS total_value_change
FROM pe_data fs
ORDER BY fs.assigned_unid, fs.report_date;

SELECT assigned_unid, report_date, capital_called_in_period, distributions_in_period FROM time_series_flows
LIMIT 20;