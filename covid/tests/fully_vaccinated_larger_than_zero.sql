select
    *
from
    {{ ref('final_covid') }}
where
    fully_vaccinated < 0
