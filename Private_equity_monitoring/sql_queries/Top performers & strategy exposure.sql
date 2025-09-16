USE pe_portfolio;

-- top by IRR
DROP TABLE IF EXISTS top_by_irr;
CREATE TABLE top_by_irr AS
SELECT assigned_unid, fund_name, vintage_year, irr, tvpi_reported, total_contributed, total_value
FROM fund_kpis
ORDER BY irr DESC
LIMIT 50;

-- top by IRR with strategy
DROP TABLE IF EXISTS top_by_irr_strategy;
CREATE TABLE top_by_irr_strategy AS
SELECT fk.assigned_unid,
       fk.fund_name,
       ls.strategy,
       fk.vintage_year,
       fk.irr,
       fk.tvpi_reported,
       fk.total_contributed,
       fk.total_value
FROM fund_kpis fk
LEFT JOIN latest_snapshot ls 
       ON fk.assigned_unid = ls.assigned_unid
ORDER BY fk.irr DESC
LIMIT 50;

SELECT * FROM top_by_irr_strategy;




