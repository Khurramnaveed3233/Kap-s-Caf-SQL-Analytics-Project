
#  Kap’s Café – SQL Analytics Project  

![CoverImage](https://github.com/user-attachments/assets/672c199f-aaaf-4ea7-8c77-df550529f424)

##  Objective  

Analyzed sales, orders, and product quantities at **Kap's Café** using SQL Server to uncover monthly revenue trends, demand shifts, and performance drivers. Through advanced SQL techniques including **LAG Window Functions, monthly aggregations, and MoM comparative analysis**, the project transforms raw transaction data into clear, actionable business intelligence for café management.


---

##  Business Problem

Kap's Café management was making decisions **without data**. Their transaction data existed but was never analyzed — creating critical blind spots in:

- **Monthly revenue tracking** — no visibility into how much was earned each month
- **Order volume trends** — no way to detect declining or growing customer activity
- **Product demand shifts** — no insight into what was selling and when
- **Operational efficiency** — no data to guide staffing, inventory, or promotions

---

##  Dataset

| Field | Description |
|---|---|
| `transaction_id` | Unique identifier per transaction |
| `transaction_date` | Date of transaction — basis for monthly aggregation |
| `unit_price` | Price of each item sold |
| `transaction_qty` | Quantity of items sold per transaction |
| `Revenue` | Derived metric — `unit_price × transaction_qty` |


##  Business Questions & Insights  

### Q1. What is the total sales value (₹) for each month?  

<img width="1027" height="517" alt="1" src="https://github.com/user-attachments/assets/19bb174a-cf9c-48e8-9282-ca93ce7d58d4" />

**Insight:** Sales revenue showed **peaks and troughs**; weak months highlighted opportunities for targeted promotions.  

### Q2. What is the MoM increase or decrease in total sales?  

<img width="1023" height="519" alt="2" src="https://github.com/user-attachments/assets/74f19eb2-72f1-4007-a3c1-5ff6046d6203" />

**Insight:** Revealed both **steady growth** months and sharp declines, pinpointing **risk and opportunity periods**.  

### Q3. What is the absolute difference in sales vs. previous month?  

<img width="1019" height="509" alt="3" src="https://github.com/user-attachments/assets/67f06317-69bf-46bd-a2cb-de94ee1b693d" />

**Insight:** Exposed **volatility** in café performance; anomalous months likely linked to seasonality or external factors.  

### Q4. What is the total number of orders per month?  

<img width="1019" height="535" alt="4" src="https://github.com/user-attachments/assets/aa294ce5-9557-4519-a4e0-92c42a601abf" />

**Insight:** Reflected **customer engagement**. Higher orders aligned with busy café periods; dips signaled weak demand.  

### Q5. What is the MoM change in number of orders?  

<img width="1019" height="516" alt="5" src="https://github.com/user-attachments/assets/882fb782-d21e-4cb2-9174-e243ba3cd779" />

**Insight:** Declining orders during steady revenue months suggested **premium-pricing effects**.  

### Q6. What is the absolute difference in orders vs. previous month?  

<img width="1007" height="531" alt="6" src="https://github.com/user-attachments/assets/9015fd87-ec42-43d3-8ad0-b7cdff6d4c95" />

**Insight:** Quantified **scale of customer activity shifts**, flagging months of sharp drop-offs.  

### Q7. Total Quantity Sold Analysis (with MoM & absolute differences)  

<img width="1019" height="524" alt="7" src="https://github.com/user-attachments/assets/33285cc4-f61f-4035-8e6c-1cb35369ca37" />

**Insight:** Variability in demand intensity; sometimes **fewer items but higher sales** → premium product influence.  

### Q8. What is the total quantity sold per month? 

<img width="1010" height="526" alt="8" src="https://github.com/user-attachments/assets/8e865e19-f12f-468c-a918-c0c2e69c8229" />

**Insight:** Unit counts revealed **product movement**, with peaks indicating high-demand seasons.  

### Q9. What is the MoM change in quantity sold?  

<img width="1005" height="521" alt="9" src="https://github.com/user-attachments/assets/a3f2c40e-8bbc-4023-bac6-0213e8b456f1" />

**Insight:** Detected demand spikes/drops tied to **promotions or seasonal boosts**.  

### Q10. What is the absolute difference in quantity sold vs. previous month?  

<img width="1030" height="537" alt="10" src="https://github.com/user-attachments/assets/596dd965-be82-4c9f-a1dd-53b7dafe4675" />

**Insight:** Showed **demand volatility**; large swings imply inventory challenges, while stable months signal consistency.  

---


## 🔍 Key Findings

### Revenue Trends
- Sales revenue shows clear **peaks and troughs** across months
- Some months maintain stable revenue despite **lower order volumes** — indicating a **premium pricing effect** where customers spend more per visit
- Weak months present clear opportunities for **targeted promotional campaigns**

### Order Patterns
- Order volumes are **inconsistent** and do not always align with revenue trends
- Months with declining orders but steady revenue confirm customers are placing **higher-value orders**
- Sharp order drop-offs in certain months signal **seasonal demand weakness**

### Quantity Dynamics
- Demand is **volatile** — large MoM swings indicate inventory planning challenges
- Quantity spikes are tied to **seasonal demand or promotions**
- Stable quantity months signal **predictable, consistent customer behavior**

---

## 💡 Business Recommendations

| Area | Recommendation |
|---|---|
| Weak Month Revenue | Launch targeted promotions and bundle offers during historically low months |
| Inventory Planning | Align stock levels with seasonal demand patterns to reduce waste |
| Customer Retention | Introduce a loyalty program to stabilize repeat order volumes |
| Pricing Strategy | Leverage premium-pricing opportunities — revenue can grow even with fewer orders |
| Demand Forecasting | Use MoM trend data to anticipate slow periods and plan ahead |

---

## 🛠️ Technical Approach

### SQL Server Techniques Used
```sql
-- Example: MoM Sales Growth using LAG Window Function
SELECT
    FORMAT(transaction_date, 'yyyy-MM') AS Month,
    SUM(unit_price * transaction_qty) AS Total_Revenue,
    LAG(SUM(unit_price * transaction_qty)) OVER (ORDER BY FORMAT(transaction_date, 'yyyy-MM')) AS Prev_Month_Revenue,
    SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty)) OVER (ORDER BY FORMAT(transaction_date, 'yyyy-MM')) AS MoM_Difference
FROM KAPS
GROUP BY FORMAT(transaction_date, 'yyyy-MM');
```

| Technique | Purpose |
|---|---|
| `SUM()` + `GROUP BY` | Monthly revenue, orders, and quantity aggregation |
| `LAG()` Window Function | Month-over-month comparison for all KPIs |
| `COUNT(DISTINCT)` | Unique order volume per month |
| Arithmetic on Window Results | Absolute difference calculation for volatility analysis |
| `FORMAT()` Date Function | Monthly bucketing of transaction dates |

### Analytical Methodology
1. **Data Extraction** — Pulled all sales data from the `KAPS` table
2. **Monthly Aggregation** — Grouped transactions into monthly buckets
3. **Window Functions** — Applied `LAG()` to calculate MoM growth and decline
4. **Absolute Differences** — Measured volatility and stability in performance
5. **Business Interpretation** — Translated SQL outputs into actionable recommendations

---

##  Repository Structure
```
📂 Kap-s-Caf-SQL-Analytics-Project
├── 📄 KapsCafe_Analysis.sql           — Full SQL scripts and queries
├── 🖼️  CoverImage.jpg                  — Project cover image
├── 🖼️  Query Screenshots (1-10).png    — SQL query result screenshots
└── 📄 README.md                       — Project documentation
```

---

##  Project Preview

![Kap's Cafe SQL Analytics](Kap's%20Café%20–%20SQL%20Analytics%20Project.jpg)

---

##  About

**Khurram Naveed** — Data Analyst specializing in SQL, Power BI, and business intelligence.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/khurramnaveed3233)
[![GitHub](https://img.shields.io/badge/GitHub-Portfolio-black?logo=github)](https://github.com/Khurramnaveed3233)
[![Email](https://img.shields.io/badge/Email-Contact-red?logo=gmail)](mailto:khurramnaveed4545@gmail.com)

---

>  *This project demonstrates how pure SQL — without any visualization tools — can transform raw café transaction data into clear business intelligence, proving that a strong SQL foundation is the backbone of effective data analysis.*
