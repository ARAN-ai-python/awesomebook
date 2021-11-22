SELECT 
    *
FROM 
    `awesome-preprocessing.work.production_missing_num_tb`
WHERE 
    thickness IS NOT NULL

/*
production_missing_num_tbをインポート時、スキーマを自動判定にしていたのだが、これが誤作動してthicknessのデータ型がSTRINGになってしまっていた。
そのため、NULLがNoneとなっており、上記のクエリではエラーが出てしまう事態が発生した。
これを機に、テーブルのスキーマ等を確認する癖をつけていきたい。
尚、その後にCREATE TABLE AS SELECT~ で新しくproduction_missing_num_tbを定義しなおし、thicknessのデータ型をFLOATに直しておいた。
以下がその時のクエリである。

CREATE TABLE work.production_missing_num_tb
AS
   SELECT
      type,
      length,
      CAST(thickness AS FLOAT64) AS thickness,
      fault_flg
   FROM
      `awesome-preprocessing.work.production_missing_num` #同名のテーブルを重複して作れないので、一旦ダミーのテーブルとしてproduction_missing_numテーブルを作成した



仮にNULLではなくNoneだったとしたら、以下の方法で対応できる。

SELECT 
    *
FROM 
    `awesome-preprocessing.work.production_missing_num_tb`
WHERE
    thickness != "None"
*/
