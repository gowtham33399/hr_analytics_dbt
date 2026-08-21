{% test test_less_than_val(model, column_name, threshold) %}

with test_data as (

    select {{ column_name }} as test_value
    from {{ model }}

),

valid_data as (

    select test_value
    from test_data
    where test_value < {{ threshold }}

)

select *
from valid_data

{% endtest %}