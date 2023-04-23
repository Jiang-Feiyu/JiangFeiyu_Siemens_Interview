# **Task for junior java** 
#### Intern: Jiang Feiyu
## Task 1: JavaScript perfermence optimization method
Here are the two codes provided:
</br>`for (var i = 0; i <=imgs.length; i++){ }`
</br>`var length = imags.length; for (var i = 0; i <=length; i++){ }`

The difference is mainly the way of handling the length of the imgs array.

The first code snippet uses `imgs.length` directly in the loop condition, meaning that the loop will iterate `imgs.length + 1` times, since the loop condition is `i <= imgs.length`. This can lead to accessing an index that is out of bounds and cause unexpected behavior or errors. (Especially when modifying the `imgs` array in the loop function like append or delete elements)

The second code snippet assigns `imgs.length` to a variable length, and then uses length in the loop condition. This ensures that the loop will iterate exactly `imgs.length` times, which is the desired behavior. 

Therefore, the second code snippet is preferred as it avoids accessing an index that is out of bounds and ensures that the loop runs for the correct number of iterations.
## Task 2: Grabage Collection algorithm
Garbage collection algorithms are used in programming languages to automatically manage the memory used by objects that are no longer needed. These objects are considered garbage and need to be identified so that they can be removed from memory.

There are several ways to identify an object as garbage, but the most common approach is to use a technique called reference counting. This involves keeping track of how many references there are to an object, and when there are no more references, the object is considered garbage and can be collected.

Another common technique is to use mark-and-sweep, where the garbage collector traverses the object graph, marking all reachable objects and then sweeping up the unmarked objects.

Other garbage collection algorithms include generational collection, where objects are divided into generations based on their age and collection is performed more frequently on younger generations, and concurrent collection, where the garbage collector runs concurrently with the program, allowing the program to continue executing while garbage is being collected.

The choice of garbage collection algorithm depends on the specific programming language and the requirements of the program being developed. 
## Task 3: SQL
(Same as SQL in Task 1 and Task 2?)
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