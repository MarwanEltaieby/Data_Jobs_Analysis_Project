-- Order jobs by salary and country

SELECT 
    job_title_short,
    job_country,
    ROUND(AVG(CASE
        WHEN salary_hour_avg IS NOT NULL 
            THEN CASE 
                WHEN job_schedule_type = 'Full-time' THEN salary_hour_avg * 40 * 4 * 12
                WHEN job_schedule_type = 'Part-time' THEN  salary_hour_avg * 20 * 4 * 12
            END
        ELSE salary_year_avg
    END), 2) AS yearly_salary
FROM job_postings_fact
LEFT JOIN company_dim
ON job_postings_fact.company_id = company_dim.company_id
WHERE
(
    salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL
) AND (
    job_schedule_type = 'Full-time' OR job_schedule_type = 'Part-time'
)
GROUP BY job_title_short, job_country
ORDER BY yearly_salary DESC;