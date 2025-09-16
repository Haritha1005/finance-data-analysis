# 📊 Finance Data Analysis – Private Equity Portfolio Monitoring  

This repository presents my **end-to-end project** on monitoring **Private Equity (PE) funds**, where I transformed raw financial data into structured insights using **SQL, Excel, and Tableau**.  

The objective was to analyze **cash flows, contributions, distributions, and fund performance metrics (IRR, MOIC, TVPI, DPI, RVPI)** and present them through **interactive dashboards** for investors and fund managers.  

---

## 🚀 Project Story  

### 1️⃣ The Challenge  
Private equity firms handle **complex, time-series datasets**:  
- Multiple funds, each with **quarterly financial reports**  
- Shifting values of **contributions, distributions, and NAV**  
- KPIs such as **IRR, TVPI, DPI, and RVPI** need to be continuously tracked  
- Investors demand **clear and interactive dashboards** for decision-making  

**Key question:** How do we transform this raw data into actionable insights?  

---

### 2️⃣ Data Preparation with SQL  
I used SQL to convert raw datasets into structured financial tables.  

Main steps included:  
- **Creating a `funds_snapshot` table** – staging fund details for processing  
- **Building a `time_series_flows` table** – computing quarterly contributions, distributions, and NAV  
- **Deriving KPIs** such as:  
  - **TVPI** = (Distributions + NAV) / Contributions  
  - **DPI** = Distributions / Contributions  
  - **RVPI** = NAV / Contributions  
- **Benchmarking & Ranking** funds by IRR, stage, and sector  

💻 Example SQL snippet:  
```sql
SELECT
  fs.fund_name,
  fs.report_date,
  fs.contributions,
  fs.distributions,
  fs.current_market_value,
  (fs.distributions + fs.current_market_value) / fs.contributions AS tvpi,
  fs.distributions / fs.contributions AS dpi,
  fs.current_market_value / fs.contributions AS rvpi
FROM time_series_flows fs;
````

Outputs were exported to CSV for further validation.

---

### 3️⃣ Validation with Excel

I used Excel to:

* Cross-check SQL outputs against sample reports
* Build pivot tables for **cash flow summaries**
* Validate IRR and other KPI calculations

---

### 4️⃣ Visualization with Tableau

The final stage was to develop an **interactive Tableau dashboard** featuring:

* **Fund-level KPIs** (IRR, TVPI, DPI, RVPI)
* **J-Curve visualization** for cumulative contributions vs. distributions
* **Ranking of funds** by performance and peer comparison
* Filters for **sector, vintage year, and investment stage**

🔗 Explore my dashboards on **[Tableau Public](https://public.tableau.com/app/profile/haritha1005/vizzes)**

---

## 📁 Repository Structure

```
finance_data_analysis/
│
├── sql_queries/            # SQL scripts for table creation & transformations
├── sql_output/             # Exported CSVs from SQL
├── tableau_dashboard/      # Tableau workbook & snapshots
├── docs/                   # Notes & workflow documentation
└── README.md               # Storytelling project overview
```

---

## 🛠 Tools & Skills

* **SQL** – Data preparation, transformations, KPI calculations
* **Excel** – Pivot analysis, KPI validation
* **Tableau** – Dashboarding & visual storytelling
* **Finance Knowledge** – Private equity fund metrics & investor reporting

---

## 📬 Contact

* [LinkedIn](https://www.linkedin.com/in/haritha1005/)
* **Email**: [haritha110287@gmail.com](mailto:haritha110287@gmail.com)

---

✨ This project demonstrates how I merge **finance expertise** with **data analytics** to create investor-ready insights and scalable portfolio monitoring solutions.

```
