with
    new_cases_next_two_weeks as (
        select
            nis5,
            TX_DESCR_NL,
            TX_DESCR_FR,
            PROVINCE,
            REGION,
            sum(cases) as new_cases,
            '2021-08-10' as from_date
        from
            public.cases_muni
        where
            date_of_case > from_date
            and date_of_case < dateadd(week, 8, '2021-08-10')
        group by
            nis5,
            TX_DESCR_NL,
            TX_DESCR_FR,
            PROVINCE,
            REGION
    )
select * from new_cases_next_two_weeks
