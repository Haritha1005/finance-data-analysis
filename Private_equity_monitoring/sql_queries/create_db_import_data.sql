CREATE DATABASE IF NOT EXISTS pe_portfolio;
USE pe_portfolio;

CREATE TABLE pe_data (
    report_date DATE,
    assigned_unid VARCHAR(50),
    fund_name VARCHAR(255),
    initial_investment_date DATE,
    commitment DECIMAL(15,2),
    contributions DECIMAL(15,2),
    unfunded_commitment DECIMAL(15,2),
    current_market_value DECIMAL(15,2),
    distributions DECIMAL(15,2),
    total_value DECIMAL(15,2),
    tvpi DECIMAL(10,2),
    net_benefit DECIMAL(15,2),
    irr DECIMAL(6,4),
    strategy VARCHAR(255)
);
USE pe_portfolio;
SELECT * FROM pe_data LIMIT 100;
