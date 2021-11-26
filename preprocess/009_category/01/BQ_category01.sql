# CASE文を利用してブール型に変換するAwesomeコード
SELECT 
    CASE 
        WHEN sex = 'man'
            THEN TRUE
        ELSE FALSE
    END AS sex_is_man
FROM 
    `awesome-preprocessing.work.customer_tb`


# データの値の種類毎にIDを付与する事で擬似的にカテゴリ型データを作成するAwesomeコード
WITH sex_mst AS ( # 後でcustomer_tbにinnerjoinしてmanに1、womanに2のidを付与するためのサブクエリ
    SELECT 
        sex,
        ROW_NUMBER() OVER() AS sex_mst_id # manかwomanの二値しかない状態でROW_NUMBER()関数を使うと、manの時に1、womanの時に2であるカラムsex_mst_idを作れる
    FROM 
        `awesome-preprocessing.work.customer_tb`
    GROUP BY # manと1, womanと2が対応している行が一つずつ存在すれば十分なので、重複はまとめてしまう
        sex
)

SELECT 
    base.*,
    sex_mst.sex_mst_id 
FROM 
    `awesome-preprocessing.work.customer_tb` AS base
INNER JOIN sex_mst
    ON base.sex = sex_mst.sex # sexをキーとすることで、manの隣に1、womanの隣に2が結合される
    
