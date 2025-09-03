
# ☕ Kap’s Café – SQL Analytics Project  

![CoverImage](https://github.com/user-attachments/assets/672c199f-aaaf-4ea7-8c77-df550529f424)

##  Objective  

The goal of this project is to analyze **sales, orders, and product quantities** at Kap’s Café using SQL Server.  
Through monthly aggregation, window functions, and comparative analysis, the project uncovers **trends, demand shifts, and performance drivers**, providing management with actionable insights for growth.  

---

##  Problem Statement  
Kap’s Café management struggled with making **data-driven decisions**. Their data existed but was not actively analyzed, leading to blind spots in:  
- Monthly revenue tracking  
- Order volume trends  
- Product demand shifts  
- Operational efficiency  

They posed five core business questions:  
1. How much sales revenue is generated each month?  
2. Are sales increasing or decreasing month-over-month (MoM)?  
3. What is the difference in sales and orders compared to the previous month?  
4. How many unique customer orders are received each month?  
5. How much product quantity is sold, and how does it change monthly?  

Without SQL-based analysis, these questions could not be reliably answered.  

---

##  Data Description  

**Source Table:** `KAPS`  

Each row represents a transaction line at Kap’s Café.  

**Columns Used:**  
- `transaction_id` → Unique identifier per transaction  
- `transaction_date` → Date of transaction (basis for monthly aggregation)  
- `unit_price` → Price of each item sold  
- `transaction_qty` → Quantity of items sold  

**Derived Metric:**  

- **Revenue (₹)** = `unit_price * transaction_qty`  

These fields represent the café’s **core business levers**: *how many items were sold, at what price, when, and in how many distinct orders.*  

---

##  Approach / Methodology  

1. **Data Extraction** → Pulled sales data from the `KAPS` table.  
2. **Monthly Aggregation** → Grouped transactions into monthly buckets.  
3. **Window Functions (LAG)** → Calculated MoM growth/decline in sales, orders, and quantities.  
4. **Absolute Differences** → Measured volatility and stability in performance.  
5. **Business Interpretation** → Translated SQL outputs into actionable recommendations.  

---

##  Business Questions & Insights  

### Q1. What is the total sales value (₹) for each month?  
**Insight:** Sales revenue showed **peaks and troughs**; weak months highlighted opportunities for targeted promotions.  

### Q2. What is the MoM increase or decrease in total sales?  
**Insight:** Revealed both **steady growth** months and sharp declines, pinpointing **risk and opportunity periods**.  

### Q3. What is the absolute difference in sales vs. previous month?  
**Insight:** Exposed **volatility** in café performance; anomalous months likely linked to seasonality or external factors.  

### Q4. What is the total number of orders per month?  
**Insight:** Reflected **customer engagement**. Higher orders aligned with busy café periods; dips signaled weak demand.  

### Q5. What is the MoM change in number of orders?  
**Insight:** Declining orders during steady revenue months suggested **premium-pricing effects**.  

### Q6. What is the absolute difference in orders vs. previous month?  
**Insight:** Quantified **scale of customer activity shifts**, flagging months of sharp drop-offs.  

### Q7. Total Quantity Sold Analysis (with MoM & absolute differences)  
**Insight:** Variability in demand intensity; sometimes **fewer items but higher sales** → premium product influence.  

### Q8. What is the total quantity sold per month?  
**Insight:** Unit counts revealed **product movement**, with peaks indicating high-demand seasons.  

### Q9. What is the MoM change in quantity sold?  
**Insight:** Detected demand spikes/drops tied to **promotions or seasonal boosts**.  

### Q10. What is the absolute difference in quantity sold vs. previous month?  
**Insight:** Showed **demand volatility**; large swings imply inventory challenges, while stable months signal consistency.  

---

## Key Insights (Summary)  

1. **Revenue Trends 📈** → Fluctuations across months; some stability despite lower orders, pointing to higher spend per order.  
2. **Order Patterns 🛒** → Order volumes inconsistent; revenue not always aligned, showing changing customer behavior.  
3. **Quantity Dynamics 📦** → Volatile demand; spikes tied to promotions/seasonality, drops linked to premium-pricing effects.  

---

##  Recommendations  

1. **Promotions in Weak Months 🎯** → Boost revenue where demand is historically low.  
2. **Inventory Optimization 📦** → Match stock levels to seasonal demand patterns.  
3. **Loyalty Programs 🤝** → Retain repeat customers and stabilize order volumes.  
4. **Pricing Strategy 💲** → Leverage premium-pricing opportunities when revenue rises despite fewer orders.  

---

## Conclusion  

- **SQL → Insights**: SQL transformed raw data into measurable intelligence.  
- **Visibility Achieved**: Kap’s Café gained clarity on sales, demand, and customer behavior.  
- **From Data to Impact**: Clear trends and recommendations create a roadmap for sustainable growth.  

---

## 📁 Project Structure  

