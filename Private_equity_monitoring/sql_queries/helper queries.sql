-- Annual total flows
SELECT YEAR(report_date) AS year,
       SUM(capital_called_in_period) AS total_called,
       SUM(distributions_in_period) AS total_distributed
FROM time_series_flows
GROUP BY YEAR(report_date)
ORDER BY year;

-- Concentration: top 10 funds by invested capital
SELECT fund_name, total_contributed
FROM fund_kpis
ORDER BY total_contributed DESC
LIMIT 10;
