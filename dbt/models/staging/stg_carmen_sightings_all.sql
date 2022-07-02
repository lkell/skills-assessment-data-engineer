with africa as (

    select * from {{ ref('stg_carmen_sightings_africa') }}

),

america as (

    select * from {{ ref('stg_carmen_sightings_america') }}

),

asia as (

    select * from {{ ref('stg_carmen_sightings_asia') }}

),

atlantic as (

    select * from {{ ref('stg_carmen_sightings_atlantic') }}

),

australia as (

    select * from {{ ref('stg_carmen_sightings_australia') }}

),

europe as (

    select * from {{ ref('stg_carmen_sightings_europe') }}

),

indian as (

    select * from {{ ref('stg_carmen_sightings_indian') }}

),

pacific as (

    select * from {{ ref('stg_carmen_sightings_pacific') }}

),

combined as (

    {% for sighting_source in [
        'africa', 'america', 'asia', 'atlantic', 'australia', 'europe', 'indian', 'pacific'
    ] %}

    select
        date_witness,
        date_agent,
        witness,
        agent,
        latitude,
        longitude,
        city,
        country,
        city_agent,
        has_weapon,
        has_hat,
        has_jacket,
        behavior,

        '{{ sighting_source }}' as sighting_source
    from {{ sighting_source }}

    {% if not loop.last %}union all{{ '\n  ' }}{% endif -%}

{% endfor %}

)

select * from combined
