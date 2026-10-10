SELECT
    CASE
        WHEN Tenure_Months BETWEEN 0 AND 6 THEN '0-6 Months'
        WHEN Tenure_Months BETWEEN 7 AND 12 THEN '7-12 Months'
        WHEN Tenure_Months BETWEEN 13 AND 24 THEN '13-24 Months'
        WHEN Tenure_Months BETWEEN 25 AND 36 THEN '25-36 Months'
        ELSE '37+ Months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    SUM(Churn = 'No') AS retained_customers,
    ROUND(
        SUM(Churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn_retention_dataset
GROUP BY tenure_group
ORDER BY
    CASE
        WHEN tenure_group = '0-6 Months' THEN 1
        WHEN tenure_group = '7-12 Months' THEN 2
        WHEN tenure_group = '13-24 Months' THEN 3
        WHEN tenure_group = '25-36 Months' THEN 4
        ELSE 5
    END;
