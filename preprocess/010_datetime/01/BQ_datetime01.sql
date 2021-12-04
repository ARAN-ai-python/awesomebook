# 元データから日時・日付データが文字列データとして保管されているとは考えにくいので、データベース上にあるデータは名前通りのデータ型で保存した
# 以下のサブクエリはわざと日時・日付データを文字列データに変換している
WITH timedata_string AS (
    SELECT 
        reserve_id,
        hotel_id,
        customer_id,
        CAST(reserve_datetime AS STRING) AS reserve_datetime,
        CAST(checkin_date AS STRING) AS checkin_date,
        CAST(checkin_time AS STRING) AS checkin_time,
        CAST(checkout_date AS STRING) AS checkout_date,
        people_num,
        total_price
    FROM 
        `awesome-preprocessing.work.reserve_tb`
)

SELECT 
    # BQはTO_DATE/DATETIME/TIMESTAMP関数ではなく、DATE/DATETIME/TIMESTAMP関数がある
    # 下位のデータ型に変換すると、取得しなかった情報は切り捨てられる
    DATE(reserve_datetime) AS reserve_datetime_date,
    DATETIME(reserve_datetime) AS reserve_datetime_datetime,
    TIMESTAMP(reserve_datetime) AS reserve_datetime_timestamp_utc, # 何も指定しなければutc
    TIMESTAMP(reserve_datetime, 'Asia/Tokyo') AS reserve_datetime_timestamp_jst, # タイムゾーンを指定すると時間が修正される
    
    # 以下のPARSE_DATE/DATETIME/TIMESTAMP関数でも変換できるけど面倒
    #CAST(PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', reserve_datetime) AS DATE) AS reserve_datetime_parsedate, # datetime型の文字列を直接date型に変換できない
    #PARSE_DATETIME('%Y-%m-%d %H:%M:%S', reserve_datetime) AS reserve_datetime_parsedatetime,
    #PARSE_TIMESTAMP('%F %T', reserve_datetime) AS reserve_datetime_parsedatetime, # %F::%Y-%m-%d、%T::%H:%M:%S

    # CASTでも変換できる
    CAST(TIMESTAMP(reserve_datetime) AS DATE) AS reserve_datetime_castdate,
    #CAST(PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', reserve_datetime) AS DATETIME) AS reserve_datetime_parsetimestamp_parsedatetime,

    # 文字列を合成してTIMESTAMPにできる
    TIMESTAMP(checkin_date || ' ' || checkin_time) AS checkin_date_time_timestamp,
    #PARSE_TIMESTAMP('%Y-%m-%d%H:%M:%S', checkin_date || checkin_time) AS checkin_date_time_parsetimestamp,

    # DATE型データを上位のデータ型に直すと、0で補完される
    DATE(checkin_date) AS checkin_date_date,
    DATETIME(checkin_date) AS checkin_date_datetime,
    TIMESTAMP(checkin_date) AS checkin_date_timestamp,
FROM 
    timedata_string
