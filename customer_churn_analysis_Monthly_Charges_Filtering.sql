SELECT
    CASE
        WHEN Monthly_Charges < 600 THEN 'Under 600'
        WHEN Monthly_Charges < 900 THEN '600 - 899'
        WHEN Monthly_Charges < 1200 THEN '900 - 1199'
        WHEN Monthly_Charges < 1500 THEN '1200 - 1499'
        ELSE '1500+'
    END AS monthly_charges_group,

    COUNT(*) AS total_customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate

FROM customer_churn_retention_dataset

GROUP BY
    CASE
        WHEN Monthly_Charges < 600 THEN 'Under 600'
        WHEN Monthly_Charges < 900 THEN '600 - 899'
        WHEN Monthly_Charges < 1200 THEN '900 - 1199'
        WHEN Monthly_Charges < 1500 THEN '1200 - 1499'
        ELSE '1500+'
    END

ORDER BY MIN(Monthly_Charges);
