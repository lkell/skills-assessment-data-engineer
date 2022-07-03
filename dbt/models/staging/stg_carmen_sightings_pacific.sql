with pacific_seed as (

    select * from {{ ref('seed_carmen_sightings_pacific') }}

),

renamed as (

    {{ rename_seed_columns('pacific_seed') }}

)

select * from renamed
