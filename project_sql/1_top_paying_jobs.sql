/* 
Questions to Answer:

1) what are the top 100 paying data jobs remotly?
2) what are the skills required for these top paying roles?
3) what are the most in demand skills for my role?
4) what are the top skills based on salary for my role?
5) what are the most optimal skills to learn (High demand and high paying)

*/

-- what are the top 100 paying data jobs remotly?

SELECT 
    job_id,
    name AS company_name,
    job_title_short,
    job_title,
    job_location,
    job_schedule_type,
    job_posted_date,
    CASE
        WHEN salary_hour_avg IS NOT NULL 
            THEN CASE 
                WHEN job_schedule_type = 'Full-time' THEN salary_hour_avg * 40 * 4 * 12
                WHEN job_schedule_type = 'Part-time' THEN  salary_hour_avg * 20 * 4 * 12
            END
        ELSE salary_year_avg
    END AS yearly_salary
FROM job_postings_fact
LEFT JOIN company_dim
ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short LIKE '%Data%' AND
(
    salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL
) AND (
    job_schedule_type = 'Full-time' OR job_schedule_type = 'Part-time'
) AND job_location = 'Anywhere'
ORDER BY yearly_salary DESC
LIMIT 10;
