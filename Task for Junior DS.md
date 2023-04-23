# **Task for junior DS** 
#### Intern: Jiang Feiyu
## Q1: Binary Classification
```
import pandas as pd

# Read from Training_part1.csv and Training_part2.csv file
df1 = pd.read_csv("Training_part1.csv")
df2 = pd.read_csv("Training_part2.csv")

# split into several columns
df1 = df1['BIB;COD;ERG;FAN;GJAH;LUK;MYR;NUS;PKD;RAS;id'].str.split(';', expand=True)
df2 = df2['SIS;TOK;UIN;VOL;WET;KAT;XIN;Class;id'].str.split(';', expand=True)

# rename the column
df1 = df1.rename(columns={
    0: 'BIB',
    1: 'COD',
    2: 'ERG',
    3: 'FAN',
    4: 'GJAH',
    5: 'LUK',
    6: 'MYR',
    7: 'NUS',
    8: 'PKD',
    9: 'RAS',
    10: 'id'
})

df2 = df2.rename(columns={
    0: 'SIS',
    1: 'TOK',
    2: 'UIN',
    3: 'VOL',
    4: 'WET',
    5: 'KAT',
    6: 'XIN',
    7: 'class',
    8: 'id'
})

# Merge the dataframe according to 'id'
merged_df = pd.merge(df1, df2, on='id')
print(merged_df)

# save the new data
merged_df.to_csv("merged_training_data.csv", index=False)

# get the target variable “class”
target_variable = merged_df["class"]
print(target_variable)
```
Output:
```
      BIB  COD  ERG    FAN GJAH      LUK  MYR        NUS  PKD RAS    id  \
0     160  iii  www   80.0  iii      5.0  eee   800000.0  xxx   t     0   
1     153  uuu  aaa  200.0  rrr      0.0  mmm  2000000.0  xxx         1   
2     153  uuu  aaa  200.0  rrr      0.0  mmm  2000000.0  xxx         1   
3       5  iii  www   96.0  iii     19.0   hh   960000.0   hh   t     2   
4       9  iii  www    0.0  iii    120.0  kkk        0.0  qqq         3   
...   ...  ...  ...    ...  ...      ...  ...        ...  ...  ..   ...   
4470   74  iii  www         iii  26726.0  sss             xxx   t  3695   
4471  179  iii  www  120.0  iii      0.0  sss  1200000.0  xxx   t  3696   
4472   82  iii  www    0.0  iii    221.0  eee        0.0  xxx      3697   
4473   13  iii  www  100.0  iii      3.0  yyy  1000000.0  xxx      3698   
4474   57  iii  www    0.0  iii   4000.0  ggg        0.0  xxx   f  3699   

        SIS TOK    UIN VOL WET  KAT XIN class  
0      1.75   t  17.92   f   1  ccc   t     n  
1      0.29   f  16.92   f   0  ddd   f     n  
2      0.29   f  16.92   f   0  ddd   f     n  
3       0.0   f  31.25   f   1  ddd   t     n  
4     0.335   f  48.17   f   0  ccc   f     n  
...     ...  ..    ...  ..  ..  ...  ..   ...  
4470   2.71   f  18.75   t   5  ccc   t     y  
4471    8.5   t   23.5   t   5  ccc   t     y  
4472    4.5   t  34.17   t  12  ddd   t     y  
4473   3.75   t  27.83   t   5  ddd   t     y  
4474    5.0   t  36.75   t   0  ccc   f     y  

[4475 rows x 19 columns]
0       n
1       n
2       n
3       n
4       n
       ..
4470    y
4471    y
4472    y
4473    y
4474    y
Name: class, Length: 4475, dtype: object
```
## Q2: Date Functions
```
import datetime

def hours_diff(start_time, end_time):
#     Calculate the difference in hours between two timestamps
    start = datetime.datetime.strptime(start_time, '%Y/%m/%d %H:%M')
    end = datetime.datetime.strptime(end_time, '%Y/%m/%d %H:%M')
    if start > end:
        return ("Start time cannot be later than end time.")
    else:
        diff = end - start
        hours = int(diff.total_seconds() / 3600)
        return (hours)

def working_hours_diff(start_time, end_time):
#     Calculate the difference in working hours between two timestamps
    start = datetime.datetime.strptime(start_time, '%Y/%m/%d %H:%M')
    end = datetime.datetime.strptime(end_time, '%Y/%m/%d %H:%M')
    if start > end:
        return ("Start time cannot be later than end time.")
    else:
        total_hours = hours_diff(start_time, end_time)
        weekdays = [0, 1, 2, 3, 4]  # Monday to Friday
        working_hours = 0
        current_time = start
        while current_time < end:
            if current_time.weekday() in weekdays and current_time.hour >= 9 and current_time.hour < 18:
                working_hours += 1
            current_time += datetime.timedelta(hours=1)
        return working_hours
    
print("hours_diff dunction")
print("2017/10/13 17:10", "to","2017/10/13 19:00",": ", hours_diff("2017/10/13 17:10", "2017/10/13 19:00"))
print("2017/10/13 12:10", "to","2017/10/13 19:00",": ", hours_diff("2017/10/13 12:10", "2017/10/13 19:00"))
print("2017/10/13 19:00", "to","2017/10/13 17:10",": ", hours_diff("2017/10/13 19:00", "2017/10/13 17:10"))
print("working_hours_diff dunction")
print("2023/04/23 08:00", "to", "2023/04/25 19:00", ": ", working_hours_diff("2023/04/23 08:00", "2023/04/25 19:00"))
print("2017/10/13 12:10", "to","2017/10/13 19:00",": ", working_hours_diff("2017/10/13 12:10", "2017/10/13 19:00"))
print("2017/10/13 19:00", "to","2017/10/13 17:10",": ", working_hours_diff("2017/10/13 19:00", "2017/10/13 17:10"))
```
Output:
```
hours_diff dunction
2017/10/13 17:10 to 2017/10/13 19:00 :  1
2017/10/13 12:10 to 2017/10/13 19:00 :  6
2017/10/13 19:00 to 2017/10/13 17:10 :  Start time cannot be later than end time.
working_hours_diff dunction
2023/04/23 08:00 to 2023/04/25 19:00 :  18
2017/10/13 12:10 to 2017/10/13 19:00 :  6
2017/10/13 19:00 to 2017/10/13 17:10 :  Start time cannot be later than end time.
```
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