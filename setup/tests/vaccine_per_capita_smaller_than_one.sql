select
    *
from
    {{ ref('final_covid') }}
where
    vacc_per_capita > 1
