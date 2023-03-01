with
    new_cases_next_two_weeks as (
        select
            nis5,
            TX_DESCR_NL,
            TX_DESCR_FR,
            PROVINCE,
            REGION,
            sum(cases) as new_cases,
            '{{ var("date") }}' as from_date
        from
            {{ source('covid', 'cases_muni') }}
        where
            date_of_case > from_date
            and date_of_case < dateadd(week, 8, '{{ var("date") }}')
        group by
            nis5,
            TX_DESCR_NL,
            TX_DESCR_FR,
            PROVINCE,
            REGION
    )
select * from new_cases_next_two_weeks