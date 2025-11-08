{% macro items_list(items) %}

{% for item in items %}
    SELECT '{{ item }}' AS item_name
    {% if not loop.last %}UNION ALL{% endif %}
{% endfor %}

{% endmacro %}