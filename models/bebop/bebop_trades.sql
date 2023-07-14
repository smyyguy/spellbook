{{ config(
        alias = alias('trades'),
        post_hook='{{ expose_spells(\'["polygon", "arbitrum", "ethereum"]\',
                        "project",
                        "bebop",
                        \'["alekss"]\') }}'
        )
}}

{% set bebop_models = [
    ref('bebop_polygon_trades'),
    ref('bebop_arbitrum_trades'),
    ref('bebop_ethereum_trades')
] %}

SELECT *
FROM (
    {% for dex_model in bebop_models %}
    SELECT
        blockchain,
        project,
        version,
        block_date,
        block_time,
        token_bought_symbol,
        token_sold_symbol,
        token_pair,
        token_bought_amount,
        token_sold_amount,
        token_bought_amount_raw,
        token_sold_amount_raw,
        amount_usd,
        token_bought_address,
        token_sold_address,
        taker,
        maker,
        project_contract_address,
        tx_hash,
        tx_from,
        tx_to,
        trace_address,
        evt_index
    FROM {{ dex_model }}
    {% if not loop.last %}
    UNION ALL
    {% endif %}
    {% endfor %}
)