{% macro jinja_for_testing() %}

    {% for num in range(10) %}
        {{ log("Iteration number: " ~ num, info=True) }}
    {% endfor %}

{% endmacro %}