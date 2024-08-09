-- models/staging/stg_data_1.sql
SELECT * FROM {{ source('raw', 'raw_data_1') }}

-- models/staging/stg_data_2.sql
SELECT * FROM {{ source('raw', 'raw_data_2') }}

-- models/intermediate/int_combined_data.sql
SELECT
    a.*,
    b.additional_field
FROM {{ ref('stg_data_1') }} a
LEFT JOIN {{ ref('stg_data_2') }} b ON a.id = b.id

-- models/marts/final_analysis.sql
SELECT
    field1,
    field2,
    COUNT(*) as count
FROM {{ ref('int_combined_data') }}
GROUP BY field1, field2