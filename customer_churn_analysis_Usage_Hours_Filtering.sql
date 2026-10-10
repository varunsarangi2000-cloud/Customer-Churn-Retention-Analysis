SELECT
    CASE
        WHEN Usage_Hours <= 10 THEN '1-10 Hours'
        WHEN Usage_Hours <= 20 THEN '11-20 Hours'
        WHEN Usage_Hours <= 30 THEN '21-30 Hours'
        WHEN Usage_Hours <= 40 THEN '31-40 Hours'
        ELSE '41+ Hours'
    END AS usage_hours_group,

    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,

    ROUND(
        100.0 * SUM(CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS churn_rate

FROM customer_churn_retention_dataset

GROUP BY usage_hours_group

ORDER BY MIN(Usage_Hours);
