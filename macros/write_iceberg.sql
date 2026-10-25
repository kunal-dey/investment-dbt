{% macro write_model_to_iceberg() %}
  {% if execute %}
    {% do adapter.store_relation('iceberg_store', this, [], none, none, config) %}
  {% endif %}
{% endmacro %}
