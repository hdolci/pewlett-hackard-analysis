# Pewlett Hackard Analysis Overview
The purpose of this project is to identify which employees are retiring, from which department, and to identify the up and coming employees that can replace them through a mentorship program. The initial data we receive is is through a collection of CSV files that I will import into a database as tables using Postgres.


## Results
After the CSV files were imported as tables into the database, I was able to use SQL queries to find the retiring employees (employees born between 1952 and 1955) and employees for the potential mentorship position (employees born in the year 1965). New tables were created from these queries and I was able to observe the following:

* Engineers has the highest amount of employees within retirement at 43,636(29,414 are senior engineers)
* 670(169 being senior engineers) engineers are eligible for the mentorship program
* Overall, the total number of employees approaching the retirement age outnumber the employees eligible for the mentorship 58 to 1
* Of the 90,398 retiring employees, only 2 are managers. This should be looked into to ensure the company is properly staffed with managers.


## Summary
<b>How many roles will need to be filled as the "silver tsunami" begins to make an impact?</b>

90,398 employees are approaching retirement using this query:


```
SELECT 
COUNT(title),
title
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;
```

<b>Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?</b>

Yes, there is an ample amount of employees that can mentor the next generation of Pewlett Hackard employees. The issue here is hiring more employees or expanding the mentorship criteria since the mentorship program won't be able to cover the employees who are retiring. The number of employees eligible for the mentorship by the department can be found using this query:

```
SELECT 
COUNT(title), 
title 
FROM mentorship_eligibilty
GROUP BY title 
ORDER BY COUNT(title);
```


