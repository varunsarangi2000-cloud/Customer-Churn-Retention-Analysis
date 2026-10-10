SELECT
    CASE
        WHEN Total_Charges < 10000 THEN 'Under 10000'
        WHEN Total_Charges < 20000 THEN '10000 - 19999'
        WHEN Total_Charges < 40000 THEN '20000 - 39999'
        ELSE '40000+'
    END AS total_charges_group,

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

GROUP BY total_charges_group

ORDER BY MIN(Total_Charges);
