USE pe_portfolio;

DROP TABLE IF EXISTS fund_kpis;
CREATE TABLE fund_kpis AS
SELECT
  ls.assigned_unid,
  ls.fund_name,
  YEAR(ls.initial_investment_date) AS vintage_year,
  ls.contributions AS total_contributed,
  ls.distributions AS total_distributed,
  ls.current_market_value AS market_value,
  ls.total_value AS total_value,
  CASE WHEN ls.contributions = 0 THEN NULL ELSE ROUND(ls.distributions / ls.contributions, 4) END AS dpi,
  CASE WHEN ls.contributions = 0 THEN NULL ELSE ROUND(ls.current_market_value / ls.contributions, 4) END AS rvpi,
  CASE WHEN ls.contributions = 0 THEN NULL ELSE ROUND(ls.total_value / ls.contributions, 4) END AS tvpi_calc,
  ls.tvpi AS tvpi_reported,
  ls.irr
FROM latest_snapshot ls;
-- Highest TVPI funds
SELECT * FROM fund_kpis ORDER BY tvpi_reported DESC LIMIT 20;
-- Main KPI sanity check
SELECT fund_name, tvpi_reported, tvpi_calc, total_contributed, total_value
FROM fund_kpis
ORDER BY ABS(tvpi_reported - tvpi_calc) DESC;
