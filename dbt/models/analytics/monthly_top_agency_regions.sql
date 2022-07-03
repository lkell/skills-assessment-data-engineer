with sightings as (

    select * from {{ ref('fct_sighting') }}

),

cities as (

    select * from {{ ref('dim_city') }}

),

agent_counts as (

    select
        {{ format_date_to_month('date_witness') }} as month_sighted,
        cities.city_agent,
        count(*) as times_observed
    from sightings
    inner join cities
        on sightings.dim_city_id = cities.dim_city_id
    group by month_sighted, cities.city_agent

),

agent_probs as (

    select
        *,
        times_observed / sum(times_observed) over (
            partition by month_sighted
        ) as proportion_observed,
        row_number() over (
            partition by month_sighted order by times_observed desc
        ) as observation_number
    from agent_counts

),

final as (

    select
        month_sighted,
        city_agent,
        times_observed,
        proportion_observed
    from agent_probs
    where observation_number = 1

)

select * from final
