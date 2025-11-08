{% macro jinja_testing() %}
    {% set temp = 80 %}
    {% if temp > 70 %}
    
    {% do log("The temperature is high. ", info=True) %}

    {% else %}
    
    {% do log("The temperature is low. ", info=True) %}
    {% endif %}

{% endmacro %}