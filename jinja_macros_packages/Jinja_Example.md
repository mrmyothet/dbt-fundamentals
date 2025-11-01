### Without Jinja

```sql
SELECT 
  COALESCE(start_date, '2025-01-01') as start_date, 
  COALESCE(update_date, '2025-01-01') as update_date, 
  COALESCE(end_date, '2025-01-01') as end_date
FROM Events

```

### With Jinja

```jinja
SELECT 
  {% for column in ['start_date', 'update_date', 'end_date'] %}
  COALESCE({{column}}, '2025-01-01') as {{column}}
  {% endfor %}
FROM Events 
```