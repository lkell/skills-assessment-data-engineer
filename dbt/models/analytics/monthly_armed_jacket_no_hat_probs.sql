with sightings as (

    select * from {{ ref('fct_sighting') }}

),

behavior_counts as (

    select
        {{ format_date_to_month('date_witness') }} as month_sighted,
        case
            when has_weapon and has_jacket and not has_hat then 1
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
