select a.EMPLOYEE_NUMBER,a.emp_id from  
{{ref('silver_hr_data_clean_with_lookup') }} a
inner join {{ ref('silver_quarantine_hr_data') }} b
on a.EMPLOYEE_NUMBER = b.EMPLOYEE_NUMBER
