select * from {{ ref('silver_hr_data_clean_with_lookup') }} 
where   years_at_company > total_working_years