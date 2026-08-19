

WITH bronze AS (

    SELECT *
    FROM {{ ref('bronze_hr_data') }}

),

age_group AS (

    SELECT *
    FROM {{ ref('lkp_age_group') }}

),

business_travel AS (

    SELECT *
    FROM {{ ref('lkp_business_travel') }}

),

department AS (

    SELECT *
    FROM {{ ref('lkp_department') }}

),

education AS (

    SELECT *
    FROM {{ ref('lkp_education') }}

),

education_field AS (

    SELECT *
    FROM {{ ref('lkp_education_field') }}

),

job_level AS (

    SELECT *
    FROM {{ ref('lkp_job_level') }}

),

marital_status AS (

    SELECT *
    FROM {{ ref('lkp_marital_status') }}

)

SELECT

    /* Employee Information */
    b.emp_id,
    b.age,

    /* Age Group Lookup */
    b.age_group,
    ag.age_group_code,
    ag.age_group_description,
    ag.min_age,
    ag.max_age,

    /* Attrition */
    b.attrition,

    /* Business Travel Lookup */
    b.business_travel,
    bt.business_travel_code,
    bt.business_travel_description,

    /* Compensation / Job Information */
    b.daily_rate,

    /* Department Lookup */
    b.department,
    d.department_code,
    d.department_name,
    d.department_description,

    b.distance_from_home,

    /* Education Lookup */
    b.education,
    e.education_code,
    e.education_level,
    e.education_description,

    /* Education Field Lookup */
    b.education_field,
    ef.education_field_code,
    ef.education_field_description,

    /* Employee Details */
    b.employee_count,
    b.employee_number,

    /* Satisfaction */
    b.environment_satisfaction,

    /* Personal Details */
    b.gender,
    b.hourly_rate,

    /* Job Details */
    b.job_involvement,

    /* Job Level Lookup */
    b.job_level,
    jl.job_level_code,
    jl.job_level_description,

    b.job_role,
    b.job_satisfaction,

    /* Marital Status Lookup */
    b.marital_status,
    ms.marital_status_code,
    ms.marital_status_description,

    /* Salary Information */
    b.monthly_income,
    b.salary_slab,
    b.monthly_rate,

    /* Experience */
    b.num_companies_worked,

    /* Employee Eligibility */
    b.over_18,

    /* Overtime */
    b.over_time,

    /* Performance */
    b.percent_salary_hike,
    b.performance_rating,
    b.relationship_satisfaction,

    /* Working Conditions */
    b.standard_hours,
    b.stock_option_level,
    b.total_working_years,
    b.training_times_last_year,
    b.work_life_balance,

    /* Company Experience */
    b.years_at_company,
    b.years_in_current_role,
    b.years_since_last_promotion,
    b.years_with_curr_manager

FROM bronze b

/* Age Group */
LEFT JOIN age_group ag
    ON b.age_group = ag.age_group_description

/* Business Travel */
LEFT JOIN business_travel bt
    ON b.business_travel = bt.business_travel_description

/* Department */
LEFT JOIN department d
    ON b.department = d.department_name

/* Education */
LEFT JOIN education e
    ON b.education = e.education

/* Education Field */
LEFT JOIN education_field ef
    ON b.education_field = ef.education_field_description

/* Job Level */
LEFT JOIN job_level jl
    ON b.job_level = jl.job_level

/* Marital Status */
LEFT JOIN marital_status ms
    ON b.marital_status = ms.marital_status_description
