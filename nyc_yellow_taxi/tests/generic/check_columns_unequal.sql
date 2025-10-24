{% test check_columns_unequal(model, column_name, column_name2) %}

select *
from {{ model }}
where {{ column_name }} = {{ column_name2 }}

{% endtest %}