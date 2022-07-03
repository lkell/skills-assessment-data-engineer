with australia_seed as (

    select * from {{ ref('seed_carmen_sightings_australia') }}

),

renamed as (

    {{ rename_seed_columns('australia_seed') }}

)

select * from renamed
