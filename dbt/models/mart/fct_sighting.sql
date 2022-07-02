{{ config(
    materialized = 'table',
    indexes=[
      {'columns': ['fct_sighting_id'], 'unique': True},
      {'columns': ['dim_city_id']},
    ]
) -}}

with sightings as (

    select * from {{ ref('stg_carmen_sightings_all') }}

),

final as (

    select distinct
        {{ dbt_utils.surrogate_key(['date_witness']) }} as fct_sighting_id,
        {{ dbt_utils.surrogate_key(['city']) }} as dim_city_id,
        date_witness,
        date_agent,
        witness,
        agent,
        has_weapon,
        has_hat,
        has_jacket,
        behavior
    from sightings

)


select * from final
