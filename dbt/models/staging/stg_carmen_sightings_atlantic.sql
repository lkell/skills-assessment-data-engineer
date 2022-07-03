with atlantic_seed as (

    select * from {{ ref('seed_carmen_sightings_atlantic') }}

),

renamed as (

    {{ rename_seed_columns('atlantic_seed') }}

)

select * from renamed
