{{ config(
	tags=['legacy'],
    schema = 'tigris_polygon',
    alias = alias('events_liquidate_position', legacy_model=True)
    )
}}

SELECT 
    1  as dummy