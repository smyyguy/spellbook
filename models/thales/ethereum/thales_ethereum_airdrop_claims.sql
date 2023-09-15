{{
    config(
        tags = ['dunesql', 'static'],
        schema = 'thales_ethereum',
        alias = alias('airdrop_claims'),
        materialized = 'table',
        file_format = 'delta',
        unique_key = ['recipient', 'tx_hash', 'evt_index'],
        post_hook='{{ expose_spells(\'["ethereum"]\',
                                "project",
                                "thales",
                                \'["hildobby"]\') }}'
    )
}}

{% set thales_token_address = '0x03e173ad8d1581a4802d3b532ace27a62c5b81dc' %}

WITH more_prices AS (
    SELECT MIN(hour) AS min_hour
    , MAX(hour) AS max_hour
    , MIN_BY(median_price, hour) AS min_price
    , MAX_BY(median_price, hour) AS max_price
    FROM {{ ref('dex_prices') }}
    WHERE blockchain = 'ethereum'
    AND contract_address= {{thales_token_address}}
    )

SELECT 'ethereum' AS blockchain
, CAST(date_trunc('month', t.evt_block_time) as date) as block_month
, t.evt_block_time AS block_time
, t.evt_block_number AS block_number
, 'Thales' AS project
, 'Thales Airdrop' AS airdrop_identifier
, t.claimer AS recipient
, t.contract_address
, t.evt_tx_hash AS tx_hash
, t.amount AS amount_raw
, CAST(t.amount/POWER(10, 18) AS double) AS amount_original
, CASE WHEN t.evt_block_time >= (SELECT min_hour FROM more_prices) AND t.evt_block_time <= (SELECT max_hour FROM more_prices) THEN CAST(pu.median_price*t.amount/POWER(10, 18) AS double)
    WHEN t.evt_block_time < (SELECT min_hour FROM more_prices) THEN CAST((SELECT min_price FROM more_prices)*t.amount/POWER(10, 18) AS double)
    WHEN t.evt_block_time > (SELECT max_hour FROM more_prices) THEN CAST((SELECT max_price FROM more_prices)*t.amount/POWER(10, 18) AS double)
    END AS amount_usd
, {{thales_token_address}} AS token_address
, 'THALES' AS token_symbol
, t.evt_index
FROM {{ source('thales_ethereum', 'Airdrop_evt_Claim') }} t
LEFT JOIN {{ ref('dex_prices') }} pu ON pu.blockchain = 'ethereum'
    AND pu.contract_address= {{thales_token_address}}
    AND pu.hour = date_trunc('hour', t.evt_block_time)
WHERE t.evt_block_time BETWEEN TIMESTAMP '2021-09-15' AND TIMESTAMP '2022-02-02'