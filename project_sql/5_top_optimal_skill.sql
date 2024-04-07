/* 
Questions to Answer:

1) what are the top 100 paying data jobs remotly?
2) what are the skills required for these top paying roles?
3) what are the most in demand skills for my role?
4) what are the top skills based on salary for my role?
5) what are the most optimal skills to learn (High demand and high paying)

*/

-- what are the most optimal skills to learn (High demand and high paying)
-- query 3 + query 4

WITH CTE_skill_per_job AS(
SELECT
    skills,
    COUNT(*) AS job_count
FROM job_postings_fact
INNER JOIN skills_job_dim 
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY job_count DESC), CTE_skill_per_avg_salary AS(
SELECT 
    skills,
    ROUND(AVG(CASE
        WHEN salary_hour_avg IS NOT NULL 
            THEN CASE 
                WHEN job_schedule_type = 'Full-time' THEN salary_hour_avg * 40 * 4 * 12
                WHEN job_schedule_type = 'Part-time' THEN  salary_hour_avg * 20 * 4 * 12
            END
        ELSE salary_year_avg
    END), 0) AS yearly_salary_avg
FROM job_postings_fact
INNER JOIN skills_job_dim 
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    (salary_hour_avg IS NOT NULL OR salary_year_avg IS NOT NULL) AND
    (job_schedule_type = 'Full-time' OR job_schedule_type = 'Part-time')
GROUP BY skills
ORDER BY yearly_salary_avg DESC
)

SELECT
    CTE_skill_per_avg_salary.skills,
    job_count,
    yearly_salary_avg
FROM CTE_skill_per_job
INNER JOIN CTE_skill_per_avg_salary
ON CTE_skill_per_job.skills = CTE_skill_per_avg_salary.skills
ORDER BY
    job_count DESC,
    yearly_salary_avg DESC
LIMIT 25;