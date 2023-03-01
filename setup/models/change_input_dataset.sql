SELECT
*
FROM
{% if var('source1') == 'true' %}
     {{ source('covid', 'vacc_muni_cum') }}  cases
{% else %}
     {{ source('covid', 'cases_muni') }}  cases
{% endif %}