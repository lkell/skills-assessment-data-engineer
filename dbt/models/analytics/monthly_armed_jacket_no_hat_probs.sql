with sightings as (

    select * from {{ ref('fct_sighting') }}

),

behavior_counts as (

    select
        {{ format_date_to_month('date_witness') }} as month_sighted,
        case
            when has_weapon = cast(1 as bool)
                and has_jacket = cast(1 as bool)
                and has_hat = cast(0 as bool)
                then 1
            else 0
        end as matches_behavior
    from sightings

),

final as (

    select
        month_sighted,
        1.0 * sum(matches_behavior) / count(*) as behavior_prob
    from behavior_counts
    group by month_sighted

)

select * from final
