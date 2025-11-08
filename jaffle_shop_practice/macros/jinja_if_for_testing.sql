{% macro jinja_if_for_testing() %}

    {% for num in range(10) %}
        {% if num == 7 %}
            {{ log("This is lucky number: " ~ num, info=True) }}
        {% else %}
            {{ log("This is normal number: " ~ num, info=True) }}
        {% endif %}
    {% endfor %}

{% endmacro %}