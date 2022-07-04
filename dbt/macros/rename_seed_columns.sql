{% macro rename_seed_columns(table) -%}

    select * from (
        select
            cast(null as date) as date_witness,
            cast(null as date) as date_agent,
            null as witness,
            null as agent,

            cast(null as float8) as latitude,
            cast(null as float8) as longitude,
            null as city,

            null as country,
            null as city_agent,

            cast(null as bool) as has_weapon,
            cast(null as bool) as has_hat,
            cast(null as bool) as has_jacket,

            null as behavior
        
        limit 0
    ) as col_mapping

    union all

    select * from {{ table }}

{%- endmacro %}
