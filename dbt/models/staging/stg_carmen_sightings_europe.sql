with europe_seed as (

    select * from {{ ref('seed_carmen_sightings_europe') }}

),

renamed as (

    {{ rename_seed_columns('europe_seed') }}

)

select * from renamed
