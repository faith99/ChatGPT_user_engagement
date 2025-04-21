-- Question 1: What percentage of user queries in July 2024 were related to either 'technology' or 'science' domains?
WITH total AS (
    SELECT COUNT(query_id) AS total_query
    FROM fct_queries
    WHERE strftime('%Y-%m', query_timestamp) = '2024-07'
)
SELECT 
    (COUNT(query_id) * 100.0 / total.total_query) AS per_query
FROM fct_queries, total
WHERE strftime('%Y-%m', query_timestamp) = '2024-07'
  AND (query_domain = 'science' OR query_domain = 'technology');