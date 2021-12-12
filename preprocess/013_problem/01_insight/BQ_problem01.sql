WITH age_and_sex AS (
    SELECT 
        customer_id,
        sex,
        CASE 
            WHEN age >= 60 THEN '60歳以上'
            ELSE CAST(FLOOR(age / 10) * 10 AS STRING)
        END AS age_rank
    FROM 
        `awesome-preprocessing.work.customer_tb`
)

SELECT 
    aas.age_rank,
    aas.sex,
    COUNT(DISTINCT aas.customer_id) AS customer_cnt,
    COUNT(*) AS rsv_cnt,
    AVG(people_num) AS people_num_avg,
    AVG(total_price / people_num) AS price_per_person_avg
FROM 
    age_and_sex AS aas
    JOIN `awesome-preprocessing.work.reserve_tb` AS rt
        ON rt.customer_id = aas.customer_id
WHERE 
    rt.checkin_date BETWEEN '2016-01-01' AND '2017-01-01'
GROUP BY 
    age_rank, sex
ORDER BY
    age_rank ASC
