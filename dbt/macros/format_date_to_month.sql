{% macro format_date_to_month(date_col) -%}

    concat(to_char({{ date_col }}, 'MM'), '-',  to_char({{ date_col }}, 'month') )

{%- endmacro %}
