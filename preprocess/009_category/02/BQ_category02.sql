# 二通りの方法で実現できる
# 1
SELECT 
    *,
    CASE
        WHEN sex = 'man' THEN TRUE
        ELSE FALSE
    END AS sexman,
    CASE
        WHEN sex = 'woman' THEN TRUE
        ELSE FALSE
    END AS sexwoman
FROM 
    `awesome-preprocessing.work.customer_tb`

# 2
SELECT 
    *,
    CASE sex
        WHEN 'man' THEN TRUE
        ELSE FALSE
    END AS sexman,
    CASE sex
        WHEN 'woman' THEN TRUE
        ELSE FALSE
    END AS sexwoman
FROM 
    `awesome-preprocessing.work.customer_tb`
