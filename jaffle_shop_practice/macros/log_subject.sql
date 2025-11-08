{% macro log_subject() %}

    {% set subjects = ['dbt', 'sql', 'python'] %}

    {% for subject in subjects %}
        {% if subject == 'dbt' %}
            {{ log("Current attending subject: " ~ subject, info=True) }}
        {% endif %}
    {% endfor %}

{% endmacro %}