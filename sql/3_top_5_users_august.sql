-- Question 3: Identify the top 5 users with the most queries in August 2024 by their first and last name.
WITH total_query_aug AS (
    SELECT user_id, COUNT(query_id) AS total_query_user
    FROM fct_queries
    WHERE strftime('%Y-%m', query_timestamp) = '2024-08'
    GROUP BY user_id
    ORDER BY total_query_user DESC
)
SELECT d.first_name, d.last_name
FROM dim_users AS d
JOIN total_query_aug AS tq
  ON d.user_id = tq.user_id
ORDER BY tq.total_query_user DESC
LIMIT 5;