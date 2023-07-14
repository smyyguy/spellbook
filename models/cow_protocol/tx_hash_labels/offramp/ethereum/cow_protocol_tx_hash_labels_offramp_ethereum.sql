{{
    config(
        alias = alias('tx_hash_labels_offramp_ethereum'),
    )
}}

with
 offramp_trades as (
    select
        *
    from (
        select tx_hash, evt_index, project, version
        from {{ ref('dex_aggregator_trades') }}
        where blockchain = 'ethereum'
        and token_bought_address in (select contract_address from {{ ref('tokens_ethereum_erc20_stablecoins') }})
        and token_sold_address not in (select contract_address from {{ ref('tokens_ethereum_erc20_stablecoins') }})
        UNION ALL
        select tx_hash, evt_index, project, version
        from {{ ref('dex_trades') }}
        where blockchain = 'ethereum'
        and token_bought_address in (select contract_address from {{ ref('tokens_ethereum_erc20_stablecoins') }})
        and token_sold_address not in (select contract_address from {{ ref('tokens_ethereum_erc20_stablecoins') }})
    )
 )

select
  "ethereum" as blockchain,
  concat(tx_hash, CAST(evt_index AS VARCHAR(100)), project, version) as tx_hash_key,
  "Offramp to stable" AS name,
  "tx_hash" AS category,
  "gentrexha" AS contributor,
  "query" AS source,
  CAST('2023-02-21' AS TIMESTAMP) as created_at,
  now() as updated_at,
  "offramp" as model_name,
  "usage" as label_type
from
  offramp_trades
