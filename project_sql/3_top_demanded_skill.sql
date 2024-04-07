/* 
Questions to Answer:

1) what are the top 100 paying data jobs remotly?
2) what are the skills required for these top paying roles?
3) what are the most in demand skills for my role?
4) what are the top skills based on salary for my role?
5) what are the most optimal skills to learn (High demand and high paying)

*/

-- what are the most in demand skills for my role?

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
ORDER BY job_count DESC
LIMIT 10;

-- most in demand job for java
SELECT 
    job_title_short,
    job_title,
    COUNT(*) AS job_count,
    skills
FROM job_postings_fact
INNER JOIN skills_job_dim 
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE skills = 'java'
GROUP BY job_title_short, job_title, skills
ORDER BY job_count DESC
LIMIT 100;


