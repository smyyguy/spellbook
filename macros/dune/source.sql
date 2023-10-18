{% macro source(source_name, table_name) %}
  {% set rel = builtins.source(source_name, table_name) %}
  {%- if target.type == 'trino' -%}
      {% set newrel = rel.replace_path(database="delta_prod") %}
    {% do return(newrel) %}
  {%- else -%}
    {% do return(rel) %}
  {%- endif -%}
{% endmacro %}

{% macro dune_source(source_name, table_name) %}
  {% set rel = builtins.source(source_name, table_name).replace_path(database="dune") %}
  {% do return(rel) %}
{% endmacro %}

