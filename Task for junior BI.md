# **Task for junior BI** 
#### Intern: Jiang Feiyu
## Q1: What's the different of excel and BI tools, why we need use BI tools?
- **Excel**: More suitable for handling data amount less than 100w. The diagram and analysis format is simple, and often need to manually input various dirty data.
- **BI**: More sutiable for dealing data whose volume exceeds 100w. Especially when having requirements of real-time data and interactive analysis, table sharing and collaboration. BI tools also provides data authority management.
- **To conclude**, Excel tools are suitable for personal analysis of small data, manual maintenance of data, flexible presentation of complex tables, and spreadsheet making scenarios, while BI tools are suitable for big data analysis, batch data processing and automatic update, interactive analysis, sharing and collaboration, and data rights allocation scenarios.
## Q2: What's the typical BI tools in whole world. Please provide the 2021 Gartner result? How do you think?
As the Gartner result has been updated to 2023, I would use 2023 result as reference. (ref: https://www.gartner.com/doc/reprints?id=1-2D773G95&ct=230411&st=sb)
Gartner's report divides business intelligence tools into four quadrants: LEADERS, CHALLENGERS, VISONARIES, and NICHE PLAYERS. 

Among them, the LEADERS quadrant includes Tableau, Microsoft Power BI, and Qlik. Such tools with a wide range of features and powerful capabilities that lead in market share and innovation.

Among these tools, Tableau can be seen as a leading brand among business intelligence tools, offering powerful data visualization and analytics capabilities that enable rapid analysis and understanding of large amounts of data to support rapid decision making and business innovation. 

Microsoft Power BI is also a leading business intelligence tool with extensive integration and data connectivity capabilities that enable data visualization and sharing across devices, providing enterprises with comprehensive data insights.

In my opinion, the choice of business intelligence tools depends on different business needs and budgets. By learning about different business intelligence tools, companies can choose the one that suits it best and improve the efficiency of data analysis and decision making.
![螢幕截圖 2023-04-23 下午12.27.29.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/5ed9c2fc48ac409aaca7a89d56c28387~tplv-k3u1fbpfcp-watermark.image?)
<p align=center>Figure 1: Magic Quadrant for Analytics and Business Intelligence Platforms</p>

## Q3: SQL

1. SQL query to display the number of customers per industry:
```
SELECT Industry, COUNT(DISTINCT Customer_ID) AS Num_Customers
FROM Customer
GROUP BY Industry;
```
2. SQL query to display the average invoice total per industry:
```
SELECT c.Industry, AVG(s.Invoice_Total) AS Avg_Invoice_Total
FROM Customer c
INNER JOIN Sales s ON c.Customer_ID = s.Customer_ID
GROUP BY c.Industry;
```
3. SQL query to display what each customer spent per month, if that value is bigger than 100：
```
SELECT c.Customer_ID, 
       DATE_FORMAT(s.Date, '%Y-%m') AS Month, 
       SUM(s.Invoice_Total) AS Total_Spent
FROM Customer c
INNER JOIN Sales s ON c.Customer_ID = s.Customer_ID
GROUP BY c.Customer_ID, Month
HAVING Total_Spent > 100;
```