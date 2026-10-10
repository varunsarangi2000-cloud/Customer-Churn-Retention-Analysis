SELECT
    Gender,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    SUM(Churn = 'No') AS retained_customers,
    ROUND(
        SUM(Churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn_retention_dataset
GROUP BY Gender
ORDER BY churn_rate DESC;
