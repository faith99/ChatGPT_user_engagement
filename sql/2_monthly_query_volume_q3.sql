-- Question 2: Calculate the total number of queries per month in Q3 2024. Which month had the highest number of queries?
SELECT strftime('%Y-%m', query_timestamp) AS months, COUNT(query_id) AS total_query_month
FROM fct_queries
WHERE strftime('%Y-%m', query_timestamp) BETWEEN '2024-07' AND '2024-09'
GROUP BY months
ORDER BY total_query_month DESC;