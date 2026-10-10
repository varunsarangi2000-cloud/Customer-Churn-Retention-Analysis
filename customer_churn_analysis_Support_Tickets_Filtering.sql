SELECT
    CASE
        WHEN Support_Tickets = 0 THEN '0 Tickets'
        WHEN Support_Tickets BETWEEN 1 AND 2 THEN '1-2 Tickets'
        WHEN Support_Tickets BETWEEN 3 AND 4 THEN '3-4 Tickets'
        WHEN Support_Tickets BETWEEN 5 AND 6 THEN '5-6 Tickets'
        ELSE '7+ Tickets'
    END AS support_tickets_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn_retention_dataset
GROUP BY support_tickets_group
ORDER BY MIN(Support_Tickets);
