SELECT
    CASE
        WHEN Satisfaction_Score < 2 THEN '1.0-1.9'
        WHEN Satisfaction_Score < 3 THEN '2.0-2.9'
        WHEN Satisfaction_Score < 4 THEN '3.0-3.9'
        WHEN Satisfaction_Score < 5 THEN '4.0-4.9'
        ELSE '5.0'
    END AS satisfaction_group,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    SUM(Churn = 'No') AS retained_customers,
    ROUND(
        SUM(Churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn_retention_dataset
GROUP BY satisfaction_group
ORDER BY
    CASE
        WHEN satisfaction_group = '1.0-1.9' THEN 1
        WHEN satisfaction_group = '2.0-2.9' THEN 2
        WHEN satisfaction_group = '3.0-3.9' THEN 3
        WHEN satisfaction_group = '4.0-4.9' THEN 4
        ELSE 5
    END;
