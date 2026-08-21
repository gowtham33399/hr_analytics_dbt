{% test test_less_than_18(model, column_name) %}

with test_data as (

    select {{ column_name }} as test_value
    from {{ model }}

),

valid_data as (

    select test_value
    from test_data
    where test_value < 18

)

select *
from valid_data

{% endtest %}