with sightings as (

    select * from {{ ref('fct_sighting') }}

),

behavior_counts as (

    select
        behavior,
        count(*) as times_observed
    from sightings
    group by behavior

),

final as (

    select
        behavior,
        times_observed

    from (
        select
            *,
            row_number() over (order by times_observed desc) as row_order
        from behavior_counts
    ) as row_orders

    where row_order <= 3

)

select * from final
