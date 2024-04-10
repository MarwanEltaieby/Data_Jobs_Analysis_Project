/* 
Questions to Answer:

1) what are the top 100 paying data jobs remotly?
2) what are the skills required for these top paying roles?
3) what are the most in demand skills for my role?
4) what are the top skills based on salary for my role?
5) what are the most optimal skills to learn (High demand and high paying)

*/

-- what are the top skills based on salary?

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
    (salary_hour_avg IS NOT NULL OR salary_year_avg IS NOT NULL) AND
    (job_schedule_type = 'Full-time' OR job_schedule_type = 'Part-time')
GROUP BY skills
ORDER BY yearly_salary_avg DESC;

-- JSON result

/*
[
  {
    "skills": "svn",
    "yearly_salary_avg": "400000"
  },
  {
    "skills": "solidity",
    "yearly_salary_avg": "179000"
  },
  {
    "skills": "couchbase",
    "yearly_salary_avg": "160515"
  },
  {
    "skills": "datarobot",
    "yearly_salary_avg": "155486"
  },
  {
    "skills": "golang",
    "yearly_salary_avg": "155000"
  },
  {
    "skills": "mxnet",
    "yearly_salary_avg": "149000"
  },
  {
    "skills": "dplyr",
    "yearly_salary_avg": "147633"
  },
  {
    "skills": "twilio",
    "yearly_salary_avg": "138500"
  },
  {
    "skills": "digitalocean",
    "yearly_salary_avg": "136320"
  },
  {
    "skills": "puppet",
    "yearly_salary_avg": "129820"
  },
  {
    "skills": "keras",
    "yearly_salary_avg": "127013"
  },
  {
    "skills": "pytorch",
    "yearly_salary_avg": "126046"
  },
  {
    "skills": "kafka",
    "yearly_salary_avg": "124038"
  },
  {
    "skills": "hugging face",
    "yearly_salary_avg": "123950"
  },
  {
    "skills": "ansible",
    "yearly_salary_avg": "122913"
  },
  {
    "skills": "tensorflow",
    "yearly_salary_avg": "119277"
  },
  {
    "skills": "bitbucket",
    "yearly_salary_avg": "115595"
  },
  {
    "skills": "terraform",
    "yearly_salary_avg": "115330"
  },
  {
    "skills": "airflow",
    "yearly_salary_avg": "115164"
  },
  {
    "skills": "fortran",
    "yearly_salary_avg": "115000"
  },
  {
    "skills": "dynamodb",
    "yearly_salary_avg": "114000"
  },
  {
    "skills": "cassandra",
    "yearly_salary_avg": "113605"
  },
  {
    "skills": "mongodb",
    "yearly_salary_avg": "112346"
  },
  {
    "skills": "unify",
    "yearly_salary_avg": "112317"
  },
  {
    "skills": "git",
    "yearly_salary_avg": "111844"
  }
]
*/