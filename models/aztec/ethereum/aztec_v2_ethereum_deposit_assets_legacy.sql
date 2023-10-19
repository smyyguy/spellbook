{{ config(
	tags=['legacy'],
	
    schema = 'aztec_v2_ethereum',
    alias = alias('deposit_assets', legacy_model=True),
    post_hook='{{ expose_spells(\'["ethereum"]\',
                                "project",
                                "aztec_v2",
                                \'["Henrystats"]\') }}')
}}

WITH 

assets_added as (
        SELECT
            CAST('0' AS VARCHAR(5)) as asset_id,
            '0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee' as asset_address,
            null as asset_gas_limit,
            null as date_added

        UNION
        
        SELECT 
            assetId as asset_id,
            assetAddress as asset_address,
            assetGasLimit as asset_gas_limit,
            evt_block_time as date_added
        FROM 
        {{source('aztec_v2_ethereum', 'RollupProcessor_evt_AssetAdded')}}
)

SELECT 
    a.*,
    t.symbol,
    t.decimals
FROM 
assets_added a
LEFT JOIN
{{ ref('tokens_erc20_legacy') }} t
    ON a.asset_address = t.contract_address
    AND t.blockchain = 'ethereum'
; 