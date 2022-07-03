with sightings as (

    select * from {{ ref('fct_sighting') }}

),

top_behaviors as (

    select * from {{ ref('top_behaviors') }}

),

sighting_matches as (

    select
        {{ format_date_to_month('date_witness') }} as month_sighted,
        case
            when behavior in (select behavior from top_behaviors) then 1
            else 0
        end as is_behavior_in_top_behaviors
    from sightings
),

final as (

    select
        month_sighted,
        1.0 * sum(is_behavior_in_top_behaviors) / count(*) as prob_top_behavior
    from sighting_matches
    group by month_sighted

)

select * from final
