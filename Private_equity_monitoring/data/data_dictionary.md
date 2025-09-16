# Data Dictionary

### Input Data (funds_snapshot_sample.csv)
- **fund_name**: Name of the private equity fund  
- **report_date**: Date of reporting (YYYY-MM-DD)  
- **initial_investment_date**: Date of first capital call  
- **contributions**: Total contributed capital (till date)  
- **distributions**: Total cash returned to investors (till date)  
- **current_market_value**: Current portfolio valuation  
- **total_value**: Sum of distributions + current_market_value  

### Derived Tables

**fund_kpis.csv**
- fund_name  
- tvpi_reported  
- tvpi_calc (calculated total value / contributed capital)  
- total_contributed  
- total_value  

**time_series_flows.csv**
- assigned_unid  
- report_date  
- capital_call  
- distributions_in_period  

**j_curve.csv**
- vintage_year  
- report_date  
- capital_call  
- distribution  
- cumulative_net_flow  

**top_by_irr_with_strategies.csv**
- assigned_unid  
- fund_name  
- strategy  
- vintage_year  
- irr (internal rate of return)  
- tvpi_reported  
- total_contributed  
- total_value  
