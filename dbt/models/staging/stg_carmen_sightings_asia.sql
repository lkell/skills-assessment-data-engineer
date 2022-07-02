with africa_seed as (

    select * from {{ ref('seed_carmen_sightings_asia') }}

),

renamed as (

    {{ rename_seed_columns('africa_seed') }}

)

select * from renamed
