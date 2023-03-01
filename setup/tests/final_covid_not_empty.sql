with session_count as (
    select count(*) as freq 
    from {{ ref('final_covid') }}
)
  
select * from session_count where freq = 0