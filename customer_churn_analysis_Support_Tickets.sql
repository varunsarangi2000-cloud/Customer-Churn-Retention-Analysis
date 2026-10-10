SELECT
    CASE
        WHEN Support_Tickets = 0 THEN '0 Tickets'
        WHEN Support_Tickets BETWEEN 1 AND 2 THEN '1-2 Tickets'
        WHEN Support_Tickets BETWEEN 3 AND 4 THEN '3-4 Tickets'
        ELSE '5+ Tickets'
    END AS support_group,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    SUM(Churn = 'No') AS retained_customers,
    ROUND(
        SUM(Churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn_retention_dataset
GROUP BY support_group
ORDER BY
    CASE
        WHEN support_group = '0 Tickets' THEN 1
        WHEN support_group = '1-2 Tickets' THEN 2
        WHEN support_group = '3-4 Tickets' THEN 3
        ELSE 4
    END;
