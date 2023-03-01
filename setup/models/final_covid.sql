with joined as (
    select
        cases.*,
        vaccination.fully_vaccinated,
        vaccination.by_date
    from
        {{ ref('cases_trans') }} as cases
    left join
        {{ ref('vaccinations_trans')}} as vaccination
    on
        cases.nis5 = vaccination.nis5
),
population_stat as (
    select
        joined.*,
        population.population
    from
        joined
    left join
        {{ source('covid','population')}}
    on
        population.refnis = joined.nis5
),
final as(
    select
        *,
        new_cases/population as cases_per_capita,
        fully_vaccinated/population as vacc_per_capita
    from
        population_stat
)
select  * from final
