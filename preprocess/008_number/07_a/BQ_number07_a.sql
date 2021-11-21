SELECT 
    *
FROM 
    `awesome-preprocessing.work.production_missing_num_tb`
WHERE
    thickness != "None"

/*
自分がbigquery上にデータをインポートしたら、NULLではなくNoneとなっていたので上記の処理で対応した。
仮にNoneではなくNULLだったとしたら、前処理大全の方法で問題なく動作する。

WHERE
    thickness is not NULL
*/
