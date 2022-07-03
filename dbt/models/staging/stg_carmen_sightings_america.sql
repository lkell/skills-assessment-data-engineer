with america_seed as (

    select * from {{ ref('seed_carmen_sightings_america') }}

),

renamed as (

    {{ rename_seed_columns('america_seed') }}

)

select * from renamed
