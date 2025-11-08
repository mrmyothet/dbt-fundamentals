{% macro subjects_union(subjects) %}

{% for subject in subjects %}
    SELECT '{{ subject }}' AS subject_name
    {% if not loop.last %}UNION ALL{% endif %}
{% endfor %}

{% endmacro %}