{{ config(
    materialized = 'table',
    indexes=[{'columns': ['dim_city_id'], 'unique': True}],
) -}}

with sightings as (

    select * from {{ ref('stg_carmen_sightings_all') }}

),

final as (

    select distinct
        {{ dbt_utils.surrogate_key(['city']) }} as dim_city_id,
        city,
        latitude,
        longitude,
        country,
        city_agent
    from sightings

)

select * from final
