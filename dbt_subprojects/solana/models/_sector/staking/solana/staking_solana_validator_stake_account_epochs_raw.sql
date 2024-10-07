{{ config(
    schema = 'staking_solana'
  , alias = 'validator_stake_account_epochs_raw'
  , materialized = 'table'
  , file_format = 'delta'
) }}

with base as (
    SELECT 
        epoch.epoch
      , epoch.block_time as epoch_time
      , epoch.epoch_start_slot
      , epoch.epoch_next_start_slot
      , vote.stake_account
      , max_by(vote.vote_account, vote.block_time) as vote_account
    FROM {{ ref('staking_solana_stake_account_delegations') }} vote
    LEFT JOIN {{ ref('solana_utils_epochs') }} epoch
        ON first_block_epoch = true
    WHERE vote.block_slot < epoch.block_slot
    GROUP BY 1,2,3,4,5
)

SELECT 
    epoch
  , epoch_time
  , epoch_start_slot
  , epoch_next_start_slot
  , stake_account
  , vote_account
FROM base
WHERE vote_account is not null
