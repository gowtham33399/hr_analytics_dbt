

SELECT
    b.*,

    /* Identify why the record was quarantined */
    CASE
        WHEN b.emp_id IS NULL
            THEN 'EMP_ID_IS_NULL'

        WHEN b.age IS NULL
            THEN 'AGE_IS_NULL'

        WHEN b.age < 18 OR b.age > 65
            THEN 'INVALID_AGE'

        WHEN b.attrition IS NULL
            THEN 'ATTRITION_IS_NULL'

        WHEN b.attrition NOT IN ('Yes', 'No')
            THEN 'INVALID_ATTRITION'

        WHEN b.gender IS NULL
            THEN 'GENDER_IS_NULL'

        WHEN b.gender NOT IN ('Male', 'Female')
            THEN 'INVALID_GENDER'

        WHEN b.education IS NULL
            THEN 'EDUCATION_IS_NULL'

        WHEN b.education NOT BETWEEN 1 AND 5
            THEN 'INVALID_EDUCATION'

        WHEN b.job_level IS NULL
            THEN 'JOB_LEVEL_IS_NULL'

        WHEN b.job_level NOT BETWEEN 1 AND 5
            THEN 'INVALID_JOB_LEVEL'

        WHEN b.monthly_income IS NULL
            THEN 'MONTHLY_INCOME_IS_NULL'

        WHEN b.monthly_income <= 0
            THEN 'INVALID_MONTHLY_INCOME'

        WHEN b.over_time IS NULL
            THEN 'OVERTIME_IS_NULL'

        WHEN b.over_time NOT IN ('Yes', 'No')
            THEN 'INVALID_OVERTIME'

        WHEN b.employee_number IS NULL
            THEN 'EMPLOYEE_NUMBER_IS_NULL'

        ELSE 'UNKNOWN_DATA_QUALITY_ISSUE'
    END AS quarantine_reason,

    CURRENT_TIMESTAMP() AS quarantine_timestamp

FROM {{ ref('bronze_hr_data') }} b

WHERE
       b.emp_id IS NULL
    OR b.age IS NULL
    OR b.age < 18
    OR b.age > 65
    OR b.attrition IS NULL
    OR b.attrition NOT IN ('Yes', 'No')
    OR b.gender IS NULL
    OR b.gender NOT IN ('Male', 'Female')
    OR b.education IS NULL
    OR b.education NOT BETWEEN 1 AND 5
    OR b.job_level IS NULL
    OR b.job_level NOT BETWEEN 1 AND 5
    OR b.monthly_income IS NULL
    OR b.monthly_income <= 0
    OR b.over_time IS NULL
    OR b.over_time NOT IN ('Yes', 'No')
    OR b.employee_number IS NULL
