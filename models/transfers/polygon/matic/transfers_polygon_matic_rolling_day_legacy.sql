{{ config(
        tags = ['legacy'],
        alias = alias('matic_rolling_day', legacy_model=True)
        )
}}

SELECT 
1 AS DUMMY 