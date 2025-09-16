USE pe_portfolio;

DROP TABLE IF EXISTS j_curve;
CREATE TABLE j_curve AS
SELECT
  t.vintage_year,
  t.report_date,
  SUM(t.capital_called_in_period) AS capital_called_period,
  SUM(t.distributions_in_period) AS distributions_period,
  SUM(SUM(t.distributions_in_period) - SUM(t.capital_called_in_period))
    OVER (PARTITION BY t.vintage_year ORDER BY t.report_date) AS cumulative_net_flow
FROM (
  SELECT
    assigned_unid,
    report_date,
    YEAR(initial_investment_date) AS vintage_year,
    capital_called_in_period,
    distributions_in_period
  FROM time_series_flows
) t
GROUP BY t.vintage_year, t.report_date
ORDER BY t.vintage_year, t.report_date;

SELECT * FROM j_curve;
