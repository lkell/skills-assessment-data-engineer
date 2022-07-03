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

top_agents as (

    select
        month_sighted,
        city_agent,
        times_observed,
        times_observed / sum(
            times_observed
        ) over (partition by city_agent) as proportion_observed
    from (

        select
            *,
            row_number() over (
                partition by city_agent order by times_observed desc
            ) as observation_number
        from agent_counts

    ) as observation_numbers
    where observation_number = 1
)

select * from top_agents
