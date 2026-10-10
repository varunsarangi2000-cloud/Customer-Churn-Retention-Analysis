SELECT
    CASE
        WHEN Monthly_Charges < 500 THEN 'Under 500'
        WHEN Monthly_Charges < 1000 THEN '500-999'
        WHEN Monthly_Charges < 1500 THEN '1000-1499'
        ELSE '1500+'
    END AS monthly_charge_group,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    SUM(Churn = 'No') AS retained_customers,
    ROUND(
        SUM(Churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn_retention_dataset
GROUP BY monthly_charge_group
ORDER BY
    CASE monthly_charge_group
        WHEN 'Under 500' THEN 1
        WHEN '500-999' THEN 2
        WHEN '1000-1499' THEN 3
        ELSE 4
    END;
