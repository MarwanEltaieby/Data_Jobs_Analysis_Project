/* 
Questions to Answer:

1) what are the top 10 paying jobs for data analysis remotly
2) what are the skills required for these top paying roles?
3) what are the most in demand skills for my role?
4) what are the top skills based on salary for my role?
5) what are the most optimal skills to learn (High demand and high paying)

*/

-- what are the skills required for these top paying roles?

WITH CTE_top_paying_jobs AS (
SELECT 
    job_id,
    name AS company_name,
    job_title_short,
    job_title,
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
LIMIT 100
)

SELECT 
    CTE_top_paying_jobs.*,
    skills
FROM CTE_top_paying_jobs
INNER JOIN skills_job_dim 
ON CTE_top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
ON skills_job_dim.skill_id = skills_dim.skill_id;

/*

- JSON code for the previous query

[
  {
    "job_id": 40145,
    "company_name": "Selby Jennings",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist/Quant Researcher",
    "yearly_salary": "550000.0",
    "skills": "sql"
  },
  {
    "job_id": 40145,
    "company_name": "Selby Jennings",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist/Quant Researcher",
    "yearly_salary": "550000.0",
    "skills": "python"
  },
  {
    "job_id": 1714768,
    "company_name": "Selby Jennings",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist - Business Analytics",
    "yearly_salary": "525000.0",
    "skills": "sql"
  },
  {
    "job_id": 627602,
    "company_name": "Algo Capital Group",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist",
    "yearly_salary": "375000.0",
    "skills": "sql"
  },
  {
    "job_id": 627602,
    "company_name": "Algo Capital Group",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist",
    "yearly_salary": "375000.0",
    "skills": "python"
  },
  {
    "job_id": 627602,
    "company_name": "Algo Capital Group",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist",
    "yearly_salary": "375000.0",
    "skills": "java"
  },
  {
    "job_id": 627602,
    "company_name": "Algo Capital Group",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist",
    "yearly_salary": "375000.0",
    "skills": "c++"
  },
  {
    "job_id": 627602,
    "company_name": "Algo Capital Group",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist",
    "yearly_salary": "375000.0",
    "skills": "cassandra"
  },
  {
    "job_id": 627602,
    "company_name": "Algo Capital Group",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist",
    "yearly_salary": "375000.0",
    "skills": "spark"
  },
  {
    "job_id": 627602,
    "company_name": "Algo Capital Group",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist",
    "yearly_salary": "375000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 627602,
    "company_name": "Algo Capital Group",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist",
    "yearly_salary": "375000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "375000.0",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "375000.0",
    "skills": "python"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "375000.0",
    "skills": "java"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "375000.0",
    "skills": "cassandra"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "375000.0",
    "skills": "spark"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "375000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "375000.0",
    "skills": "tableau"
  },
  {
    "job_id": 694031,
    "company_name": "Umbrex",
    "job_title_short": "Data Scientist",
    "job_title": "Revenue Cycle Data Scientist",
    "yearly_salary": "360000.0",
    "skills": "python"
  },
  {
    "job_id": 694031,
    "company_name": "Umbrex",
    "job_title_short": "Data Scientist",
    "job_title": "Revenue Cycle Data Scientist",
    "yearly_salary": "360000.0",
    "skills": "r"
  },
  {
    "job_id": 694031,
    "company_name": "Umbrex",
    "job_title_short": "Data Scientist",
    "job_title": "Revenue Cycle Data Scientist",
    "yearly_salary": "360000.0",
    "skills": "sas"
  },
  {
    "job_id": 694031,
    "company_name": "Umbrex",
    "job_title_short": "Data Scientist",
    "job_title": "Revenue Cycle Data Scientist",
    "yearly_salary": "360000.0",
    "skills": "sas"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "325000.0",
    "skills": "python"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "325000.0",
    "skills": "spark"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "325000.0",
    "skills": "pandas"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "325000.0",
    "skills": "numpy"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "325000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "325000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "325000.0",
    "skills": "kafka"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "325000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "325000.0",
    "skills": "python"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "325000.0",
    "skills": "spark"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "325000.0",
    "skills": "pandas"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "325000.0",
    "skills": "numpy"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "325000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "325000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "325000.0",
    "skills": "kafka"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "325000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title_short": "Data Scientist",
    "job_title": "Director Level - Product Management - Data Science",
    "yearly_salary": "320000.0",
    "skills": "azure"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title_short": "Data Scientist",
    "job_title": "Director Level - Product Management - Data Science",
    "yearly_salary": "320000.0",
    "skills": "aws"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title_short": "Data Scientist",
    "job_title": "Director Level - Product Management - Data Science",
    "yearly_salary": "320000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title_short": "Data Scientist",
    "job_title": "Director Level - Product Management - Data Science",
    "yearly_salary": "320000.0",
    "skills": "keras"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title_short": "Data Scientist",
    "job_title": "Director Level - Product Management - Data Science",
    "yearly_salary": "320000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title_short": "Data Scientist",
    "job_title": "Director Level - Product Management - Data Science",
    "yearly_salary": "320000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title_short": "Data Scientist",
    "job_title": "Director Level - Product Management - Data Science",
    "yearly_salary": "320000.0",
    "skills": "datarobot"
  },
  {
    "job_id": 457991,
    "company_name": "Lawrence Harvey",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Battery Data Science",
    "yearly_salary": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 457991,
    "company_name": "Lawrence Harvey",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Battery Data Science",
    "yearly_salary": "300000.0",
    "skills": "aws"
  },
  {
    "job_id": 457991,
    "company_name": "Lawrence Harvey",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Battery Data Science",
    "yearly_salary": "300000.0",
    "skills": "gcp"
  },
  {
    "job_id": 270455,
    "company_name": "Durlston Partners",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "300000.0",
    "skills": "sql"
  },
  {
    "job_id": 270455,
    "company_name": "Durlston Partners",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 129924,
    "company_name": "Storm4",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science",
    "yearly_salary": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 129924,
    "company_name": "Storm4",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science",
    "yearly_salary": "300000.0",
    "skills": "pandas"
  },
  {
    "job_id": 129924,
    "company_name": "Storm4",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science",
    "yearly_salary": "300000.0",
    "skills": "numpy"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "300000.0",
    "skills": "sql"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "300000.0",
    "skills": "java"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "300000.0",
    "skills": "c"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "300000.0",
    "skills": "aws"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "300000.0",
    "skills": "gcp"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title_short": "Data Scientist",
    "job_title": "Distinguished Data Scientist",
    "yearly_salary": "300000.0",
    "skills": "scala"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title_short": "Data Scientist",
    "job_title": "Distinguished Data Scientist",
    "yearly_salary": "300000.0",
    "skills": "java"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title_short": "Data Scientist",
    "job_title": "Distinguished Data Scientist",
    "yearly_salary": "300000.0",
    "skills": "spark"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title_short": "Data Scientist",
    "job_title": "Distinguished Data Scientist",
    "yearly_salary": "300000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title_short": "Data Scientist",
    "job_title": "Distinguished Data Scientist",
    "yearly_salary": "300000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title_short": "Data Scientist",
    "job_title": "Distinguished Data Scientist",
    "yearly_salary": "300000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "yearly_salary": "288000.0",
    "skills": "sql"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "yearly_salary": "288000.0",
    "skills": "python"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "yearly_salary": "288000.0",
    "skills": "nosql"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "yearly_salary": "288000.0",
    "skills": "r"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "yearly_salary": "288000.0",
    "skills": "sas"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "yearly_salary": "288000.0",
    "skills": "matlab"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "yearly_salary": "288000.0",
    "skills": "azure"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "yearly_salary": "288000.0",
    "skills": "databricks"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "yearly_salary": "288000.0",
    "skills": "aws"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "yearly_salary": "288000.0",
    "skills": "redshift"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "yearly_salary": "288000.0",
    "skills": "oracle"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "yearly_salary": "288000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "yearly_salary": "288000.0",
    "skills": "spark"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "yearly_salary": "288000.0",
    "skills": "tableau"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "yearly_salary": "288000.0",
    "skills": "sas"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "yearly_salary": "288000.0",
    "skills": "qlik"
  },
  {
    "job_id": 1177572,
    "company_name": "Home Depot / THD",
    "job_title_short": "Data Scientist",
    "job_title": "Data Science Manager, Online Customer Experience Intelligence (Remote)",
    "yearly_salary": "280000.0",
    "skills": "sql"
  },
  {
    "job_id": 1177572,
    "company_name": "Home Depot / THD",
    "job_title_short": "Data Scientist",
    "job_title": "Data Science Manager, Online Customer Experience Intelligence (Remote)",
    "yearly_salary": "280000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 1177572,
    "company_name": "Home Depot / THD",
    "job_title_short": "Data Scientist",
    "job_title": "Data Science Manager, Online Customer Experience Intelligence (Remote)",
    "yearly_salary": "280000.0",
    "skills": "tableau"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "275000.0",
    "skills": "sql"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "275000.0",
    "skills": "python"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "275000.0",
    "skills": "java"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "275000.0",
    "skills": "cassandra"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "275000.0",
    "skills": "aws"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "275000.0",
    "skills": "spark"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "275000.0",
    "skills": "airflow"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "275000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "275000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1325996,
    "company_name": "ZealoTech People",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Officer",
    "yearly_salary": "265000.0",
    "skills": "sql"
  },
  {
    "job_id": 1325996,
    "company_name": "ZealoTech People",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Officer",
    "yearly_salary": "265000.0",
    "skills": "python"
  },
  {
    "job_id": 1325996,
    "company_name": "ZealoTech People",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Officer",
    "yearly_salary": "265000.0",
    "skills": "r"
  },
  {
    "job_id": 1325996,
    "company_name": "ZealoTech People",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Officer",
    "yearly_salary": "265000.0",
    "skills": "spark"
  },
  {
    "job_id": 1325996,
    "company_name": "ZealoTech People",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Officer",
    "yearly_salary": "265000.0",
    "skills": "numpy"
  },
  {
    "job_id": 1325996,
    "company_name": "ZealoTech People",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Officer",
    "yearly_salary": "265000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1325996,
    "company_name": "ZealoTech People",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Officer",
    "yearly_salary": "265000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 1325996,
    "company_name": "ZealoTech People",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Officer",
    "yearly_salary": "265000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 1325996,
    "company_name": "ZealoTech People",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Officer",
    "yearly_salary": "265000.0",
    "skills": "gdpr"
  },
  {
    "job_id": 1325996,
    "company_name": "ZealoTech People",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Officer",
    "yearly_salary": "265000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 1325996,
    "company_name": "ZealoTech People",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Officer",
    "yearly_salary": "265000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1325996,
    "company_name": "ZealoTech People",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Officer",
    "yearly_salary": "265000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1325996,
    "company_name": "ZealoTech People",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Officer",
    "yearly_salary": "265000.0",
    "skills": "qlik"
  },
  {
    "job_id": 1325996,
    "company_name": "ZealoTech People",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Officer",
    "yearly_salary": "265000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 1325996,
    "company_name": "ZealoTech People",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Officer",
    "yearly_salary": "265000.0",
    "skills": "docker"
  },
  {
    "job_id": 257651,
    "company_name": "Storm6",
    "job_title_short": "Data Scientist",
    "job_title": "Data Science Vice President",
    "yearly_salary": "265000.0",
    "skills": "python"
  },
  {
    "job_id": 257651,
    "company_name": "Storm6",
    "job_title_short": "Data Scientist",
    "job_title": "Data Science Vice President",
    "yearly_salary": "265000.0",
    "skills": "opencv"
  },
  {
    "job_id": 89798,
    "company_name": "Cnam - Auditeurs - Accueil",
    "job_title_short": "Data Scientist",
    "job_title": "Director, Data Science",
    "yearly_salary": "265000.0",
    "skills": "python"
  },
  {
    "job_id": 89798,
    "company_name": "Cnam - Auditeurs - Accueil",
    "job_title_short": "Data Scientist",
    "job_title": "Director, Data Science",
    "yearly_salary": "265000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 89798,
    "company_name": "Cnam - Auditeurs - Accueil",
    "job_title_short": "Data Scientist",
    "job_title": "Director, Data Science",
    "yearly_salary": "265000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 294863,
    "company_name": "Movable Ink",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist, Applied AI",
    "yearly_salary": "262500.0",
    "skills": "sql"
  },
  {
    "job_id": 294863,
    "company_name": "Movable Ink",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist, Applied AI",
    "yearly_salary": "262500.0",
    "skills": "python"
  },
  {
    "job_id": 294863,
    "company_name": "Movable Ink",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist, Applied AI",
    "yearly_salary": "262500.0",
    "skills": "bigquery"
  },
  {
    "job_id": 294863,
    "company_name": "Movable Ink",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist, Applied AI",
    "yearly_salary": "262500.0",
    "skills": "spark"
  },
  {
    "job_id": 294863,
    "company_name": "Movable Ink",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist, Applied AI",
    "yearly_salary": "262500.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 294863,
    "company_name": "Movable Ink",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist, Applied AI",
    "yearly_salary": "262500.0",
    "skills": "pytorch"
  },
  {
    "job_id": 294863,
    "company_name": "Movable Ink",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist, Applied AI",
    "yearly_salary": "262500.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 294863,
    "company_name": "Movable Ink",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist, Applied AI",
    "yearly_salary": "262500.0",
    "skills": "tableau"
  },
  {
    "job_id": 294863,
    "company_name": "Movable Ink",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist, Applied AI",
    "yearly_salary": "262500.0",
    "skills": "looker"
  },
  {
    "job_id": 245928,
    "company_name": "Stealth",
    "job_title_short": "Data Scientist",
    "job_title": "Data Science Manager",
    "yearly_salary": "262500.0",
    "skills": "sql"
  },
  {
    "job_id": 245928,
    "company_name": "Stealth",
    "job_title_short": "Data Scientist",
    "job_title": "Data Science Manager",
    "yearly_salary": "262500.0",
    "skills": "python"
  },
  {
    "job_id": 245928,
    "company_name": "Stealth",
    "job_title_short": "Data Scientist",
    "job_title": "Data Science Manager",
    "yearly_salary": "262500.0",
    "skills": "scala"
  },
  {
    "job_id": 245928,
    "company_name": "Stealth",
    "job_title_short": "Data Scientist",
    "job_title": "Data Science Manager",
    "yearly_salary": "262500.0",
    "skills": "r"
  },
  {
    "job_id": 245928,
    "company_name": "Stealth",
    "job_title_short": "Data Scientist",
    "job_title": "Data Science Manager",
    "yearly_salary": "262500.0",
    "skills": "spark"
  },
  {
    "job_id": 245928,
    "company_name": "Stealth",
    "job_title_short": "Data Scientist",
    "job_title": "Data Science Manager",
    "yearly_salary": "262500.0",
    "skills": "hadoop"
  },
  {
    "job_id": 197718,
    "company_name": "Braintrust",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer - Remote",
    "yearly_salary": "259200.0",
    "skills": "aws"
  },
  {
    "job_id": 197718,
    "company_name": "Braintrust",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer - Remote",
    "yearly_salary": "259200.0",
    "skills": "terraform"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "yearly_salary": "255829.5",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "yearly_salary": "255829.5",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "yearly_salary": "255829.5",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "yearly_salary": "255829.5",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "yearly_salary": "255829.5",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "yearly_salary": "255829.5",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "yearly_salary": "255829.5",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "yearly_salary": "255829.5",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "yearly_salary": "255829.5",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "yearly_salary": "255829.5",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "yearly_salary": "255829.5",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "yearly_salary": "255829.5",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "yearly_salary": "255829.5",
    "skills": "powerpoint"
  },
  {
    "job_id": 199110,
    "company_name": "Stitch Fix",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist (Remote)",
    "yearly_salary": "253500.0",
    "skills": "python"
  },
  {
    "job_id": 1275762,
    "company_name": "Strativ Group",
    "job_title_short": "Data Scientist",
    "job_title": "Head of AI, ML & Data Science - Fintech",
    "yearly_salary": "252500.0",
    "skills": "python"
  },
  {
    "job_id": 230458,
    "company_name": "Twitch",
    "job_title_short": "Data Engineer",
    "job_title": "Director of Engineering - Data Platform",
    "yearly_salary": "251000.0",
    "skills": "spark"
  },
  {
    "job_id": 230458,
    "company_name": "Twitch",
    "job_title_short": "Data Engineer",
    "job_title": "Director of Engineering - Data Platform",
    "yearly_salary": "251000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 230458,
    "company_name": "Twitch",
    "job_title_short": "Data Engineer",
    "job_title": "Director of Engineering - Data Platform",
    "yearly_salary": "251000.0",
    "skills": "kafka"
  },
  {
    "job_id": 230458,
    "company_name": "Twitch",
    "job_title_short": "Data Engineer",
    "job_title": "Director of Engineering - Data Platform",
    "yearly_salary": "251000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 230458,
    "company_name": "Twitch",
    "job_title_short": "Data Engineer",
    "job_title": "Director of Engineering - Data Platform",
    "yearly_salary": "251000.0",
    "skills": "keras"
  },
  {
    "job_id": 230458,
    "company_name": "Twitch",
    "job_title_short": "Data Engineer",
    "job_title": "Director of Engineering - Data Platform",
    "yearly_salary": "251000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 595768,
    "company_name": "Signify Technology",
    "job_title_short": "Data Engineer",
    "job_title": "Principal Data Engineer",
    "yearly_salary": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 595768,
    "company_name": "Signify Technology",
    "job_title_short": "Data Engineer",
    "job_title": "Principal Data Engineer",
    "yearly_salary": "250000.0",
    "skills": "scala"
  },
  {
    "job_id": 595768,
    "company_name": "Signify Technology",
    "job_title_short": "Data Engineer",
    "job_title": "Principal Data Engineer",
    "yearly_salary": "250000.0",
    "skills": "databricks"
  },
  {
    "job_id": 595768,
    "company_name": "Signify Technology",
    "job_title_short": "Data Engineer",
    "job_title": "Principal Data Engineer",
    "yearly_salary": "250000.0",
    "skills": "spark"
  },
  {
    "job_id": 1489914,
    "company_name": "Smith Hanley Associates",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "250000.0",
    "skills": "sql"
  },
  {
    "job_id": 1489914,
    "company_name": "Smith Hanley Associates",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 1489914,
    "company_name": "Smith Hanley Associates",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "250000.0",
    "skills": "javascript"
  },
  {
    "job_id": 1489914,
    "company_name": "Smith Hanley Associates",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "250000.0",
    "skills": "html"
  },
  {
    "job_id": 1489914,
    "company_name": "Smith Hanley Associates",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "250000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 1489914,
    "company_name": "Smith Hanley Associates",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "250000.0",
    "skills": "vba"
  },
  {
    "job_id": 1489914,
    "company_name": "Smith Hanley Associates",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "250000.0",
    "skills": "php"
  },
  {
    "job_id": 1489914,
    "company_name": "Smith Hanley Associates",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "250000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 1489914,
    "company_name": "Smith Hanley Associates",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "250000.0",
    "skills": "aws"
  },
  {
    "job_id": 1489914,
    "company_name": "Smith Hanley Associates",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "250000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 1489914,
    "company_name": "Smith Hanley Associates",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "250000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 1489914,
    "company_name": "Smith Hanley Associates",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "250000.0",
    "skills": "excel"
  },
  {
    "job_id": 1489914,
    "company_name": "Smith Hanley Associates",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "250000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1489914,
    "company_name": "Smith Hanley Associates",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "250000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 538468,
    "company_name": "Lawrence Harvey",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Battery Data Science",
    "yearly_salary": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 538468,
    "company_name": "Lawrence Harvey",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Battery Data Science",
    "yearly_salary": "250000.0",
    "skills": "aws"
  },
  {
    "job_id": 538468,
    "company_name": "Lawrence Harvey",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Battery Data Science",
    "yearly_salary": "250000.0",
    "skills": "gcp"
  },
  {
    "job_id": 543728,
    "company_name": "Signify Technology",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 543728,
    "company_name": "Signify Technology",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "250000.0",
    "skills": "scala"
  },
  {
    "job_id": 543728,
    "company_name": "Signify Technology",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "250000.0",
    "skills": "databricks"
  },
  {
    "job_id": 543728,
    "company_name": "Signify Technology",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "250000.0",
    "skills": "spark"
  },
  {
    "job_id": 58397,
    "company_name": "Averity",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science, Biostatistics ($260k)",
    "yearly_salary": "250000.0",
    "skills": "sas"
  },
  {
    "job_id": 58397,
    "company_name": "Averity",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science, Biostatistics ($260k)",
    "yearly_salary": "250000.0",
    "skills": "sas"
  },
  {
    "job_id": 561728,
    "company_name": "AI Startup",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 561728,
    "company_name": "AI Startup",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "250000.0",
    "skills": "scala"
  },
  {
    "job_id": 561728,
    "company_name": "AI Startup",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "250000.0",
    "skills": "r"
  },
  {
    "job_id": 561728,
    "company_name": "AI Startup",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "yearly_salary": "250000.0",
    "skills": "azure"
  },
  {
    "job_id": 1151339,
    "company_name": "Ghritachi",
    "job_title_short": "Data Analyst",
    "job_title": "System Data Analyst - Full Time",
    "yearly_salary": "249600.0",
    "skills": "sql"
  },
  {
    "job_id": 1151339,
    "company_name": "Ghritachi",
    "job_title_short": "Data Analyst",
    "job_title": "System Data Analyst - Full Time",
    "yearly_salary": "249600.0",
    "skills": "python"
  },
  {
    "job_id": 1151339,
    "company_name": "Ghritachi",
    "job_title_short": "Data Analyst",
    "job_title": "System Data Analyst - Full Time",
    "yearly_salary": "249600.0",
    "skills": "sheets"
  },
  {
    "job_id": 1151339,
    "company_name": "Ghritachi",
    "job_title_short": "Data Analyst",
    "job_title": "System Data Analyst - Full Time",
    "yearly_salary": "249600.0",
    "skills": "flow"
  },
  {
    "job_id": 834658,
    "company_name": "Verizon Media",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist",
    "yearly_salary": "249600.0",
    "skills": "python"
  },
  {
    "job_id": 834658,
    "company_name": "Verizon Media",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist",
    "yearly_salary": "249600.0",
    "skills": "scala"
  },
  {
    "job_id": 834658,
    "company_name": "Verizon Media",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist",
    "yearly_salary": "249600.0",
    "skills": "java"
  },
  {
    "job_id": 834658,
    "company_name": "Verizon Media",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist",
    "yearly_salary": "249600.0",
    "skills": "aws"
  },
  {
    "job_id": 834658,
    "company_name": "Verizon Media",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist",
    "yearly_salary": "249600.0",
    "skills": "hadoop"
  },
  {
    "job_id": 834658,
    "company_name": "Verizon Media",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist",
    "yearly_salary": "249600.0",
    "skills": "pytorch"
  },
  {
    "job_id": 1513220,
    "company_name": "Block",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist (Remote)",
    "yearly_salary": "247500.0",
    "skills": "go"
  },
  {
    "job_id": 1513220,
    "company_name": "Block",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist (Remote)",
    "yearly_salary": "247500.0",
    "skills": "c"
  },
  {
    "job_id": 1442149,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Ads Measurement ML (Remote)",
    "yearly_salary": "247500.0",
    "skills": "sql"
  },
  {
    "job_id": 1442149,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Ads Measurement ML (Remote)",
    "yearly_salary": "247500.0",
    "skills": "python"
  },
  {
    "job_id": 1442149,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Ads Measurement ML (Remote)",
    "yearly_salary": "247500.0",
    "skills": "r"
  },
  {
    "job_id": 764457,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Advertiser Platform Analytics",
    "yearly_salary": "247500.0",
    "skills": "sql"
  },
  {
    "job_id": 764457,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Advertiser Platform Analytics",
    "yearly_salary": "247500.0",
    "skills": "python"
  },
  {
    "job_id": 764457,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Advertiser Platform Analytics",
    "yearly_salary": "247500.0",
    "skills": "r"
  },
  {
    "job_id": 764457,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Advertiser Platform Analytics",
    "yearly_salary": "247500.0",
    "skills": "go"
  },
  {
    "job_id": 764457,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Advertiser Platform Analytics",
    "yearly_salary": "247500.0",
    "skills": "tableau"
  },
  {
    "job_id": 764457,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Advertiser Platform Analytics",
    "yearly_salary": "247500.0",
    "skills": "looker"
  },
  {
    "job_id": 223269,
    "company_name": "Airbnb",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Staff Data Scientist - Inference, Marketing Technology",
    "yearly_salary": "245000.0",
    "skills": "sql"
  },
  {
    "job_id": 223269,
    "company_name": "Airbnb",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Staff Data Scientist - Inference, Marketing Technology",
    "yearly_salary": "245000.0",
    "skills": "python"
  },
  {
    "job_id": 223269,
    "company_name": "Airbnb",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Staff Data Scientist - Inference, Marketing Technology",
    "yearly_salary": "245000.0",
    "skills": "r"
  },
  {
    "job_id": 1118358,
    "company_name": "Airbnb",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Sr. Staff Tech Lead, Core ML Data Science",
    "yearly_salary": "245000.0",
    "skills": "python"
  },
  {
    "job_id": 1118358,
    "company_name": "Airbnb",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Sr. Staff Tech Lead, Core ML Data Science",
    "yearly_salary": "245000.0",
    "skills": "scala"
  },
  {
    "job_id": 1118358,
    "company_name": "Airbnb",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Sr. Staff Tech Lead, Core ML Data Science",
    "yearly_salary": "245000.0",
    "skills": "java"
  },
  {
    "job_id": 1118358,
    "company_name": "Airbnb",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Sr. Staff Tech Lead, Core ML Data Science",
    "yearly_salary": "245000.0",
    "skills": "c++"
  },
  {
    "job_id": 1118358,
    "company_name": "Airbnb",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Sr. Staff Tech Lead, Core ML Data Science",
    "yearly_salary": "245000.0",
    "skills": "spark"
  },
  {
    "job_id": 1118358,
    "company_name": "Airbnb",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Sr. Staff Tech Lead, Core ML Data Science",
    "yearly_salary": "245000.0",
    "skills": "airflow"
  },
  {
    "job_id": 1118358,
    "company_name": "Airbnb",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Sr. Staff Tech Lead, Core ML Data Science",
    "yearly_salary": "245000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 1118358,
    "company_name": "Airbnb",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Sr. Staff Tech Lead, Core ML Data Science",
    "yearly_salary": "245000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 204320,
    "company_name": "Handshake",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "245000.0",
    "skills": "go"
  },
  {
    "job_id": 151972,
    "company_name": "Movable Ink",
    "job_title_short": "Data Engineer",
    "job_title": "Principal Data Engineer (Remote)",
    "yearly_salary": "245000.0",
    "skills": "nosql"
  },
  {
    "job_id": 151972,
    "company_name": "Movable Ink",
    "job_title_short": "Data Engineer",
    "job_title": "Principal Data Engineer (Remote)",
    "yearly_salary": "245000.0",
    "skills": "aws"
  },
  {
    "job_id": 151972,
    "company_name": "Movable Ink",
    "job_title_short": "Data Engineer",
    "job_title": "Principal Data Engineer (Remote)",
    "yearly_salary": "245000.0",
    "skills": "gcp"
  },
  {
    "job_id": 228641,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Multi Industry",
    "yearly_salary": "243500.0",
    "skills": "sql"
  },
  {
    "job_id": 228641,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Multi Industry",
    "yearly_salary": "243500.0",
    "skills": "python"
  },
  {
    "job_id": 228641,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Multi Industry",
    "yearly_salary": "243500.0",
    "skills": "nosql"
  },
  {
    "job_id": 228641,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Multi Industry",
    "yearly_salary": "243500.0",
    "skills": "r"
  },
  {
    "job_id": 228641,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Multi Industry",
    "yearly_salary": "243500.0",
    "skills": "sas"
  },
  {
    "job_id": 228641,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Multi Industry",
    "yearly_salary": "243500.0",
    "skills": "matlab"
  },
  {
    "job_id": 228641,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Multi Industry",
    "yearly_salary": "243500.0",
    "skills": "azure"
  },
  {
    "job_id": 228641,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Multi Industry",
    "yearly_salary": "243500.0",
    "skills": "aws"
  },
  {
    "job_id": 228641,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Multi Industry",
    "yearly_salary": "243500.0",
    "skills": "redshift"
  },
  {
    "job_id": 228641,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Multi Industry",
    "yearly_salary": "243500.0",
    "skills": "oracle"
  },
  {
    "job_id": 228641,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Multi Industry",
    "yearly_salary": "243500.0",
    "skills": "spark"
  },
  {
    "job_id": 228641,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Multi Industry",
    "yearly_salary": "243500.0",
    "skills": "tableau"
  },
  {
    "job_id": 228641,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Multi Industry",
    "yearly_salary": "243500.0",
    "skills": "sas"
  },
  {
    "job_id": 228641,
    "company_name": "Teradata",
    "job_title_short": "Data Scientist",
    "job_title": "Pre-Sales Data Scientist, Multi Industry",
    "yearly_salary": "243500.0",
    "skills": "qlik"
  },
  {
    "job_id": 2446,
    "company_name": "Meta",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager",
    "yearly_salary": "242000.0",
    "skills": "sql"
  },
  {
    "job_id": 2446,
    "company_name": "Meta",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager",
    "yearly_salary": "242000.0",
    "skills": "python"
  },
  {
    "job_id": 2446,
    "company_name": "Meta",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager",
    "yearly_salary": "242000.0",
    "skills": "java"
  },
  {
    "job_id": 2446,
    "company_name": "Meta",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager",
    "yearly_salary": "242000.0",
    "skills": "perl"
  },
  {
    "job_id": 609418,
    "company_name": "Meta",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager",
    "yearly_salary": "242000.0",
    "skills": "sql"
  },
  {
    "job_id": 609418,
    "company_name": "Meta",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager",
    "yearly_salary": "242000.0",
    "skills": "python"
  },
  {
    "job_id": 609418,
    "company_name": "Meta",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager",
    "yearly_salary": "242000.0",
    "skills": "java"
  },
  {
    "job_id": 609418,
    "company_name": "Meta",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager",
    "yearly_salary": "242000.0",
    "skills": "perl"
  },
  {
    "job_id": 245337,
    "company_name": "Home Depot / THD",
    "job_title_short": "Data Scientist",
    "job_title": "Lead Data Scientist, Marketing & Online (Remote)",
    "yearly_salary": "240000.0",
    "skills": "sql"
  },
  {
    "job_id": 245337,
    "company_name": "Home Depot / THD",
    "job_title_short": "Data Scientist",
    "job_title": "Lead Data Scientist, Marketing & Online (Remote)",
    "yearly_salary": "240000.0",
    "skills": "python"
  },
  {
    "job_id": 245337,
    "company_name": "Home Depot / THD",
    "job_title_short": "Data Scientist",
    "job_title": "Lead Data Scientist, Marketing & Online (Remote)",
    "yearly_salary": "240000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 245337,
    "company_name": "Home Depot / THD",
    "job_title_short": "Data Scientist",
    "job_title": "Lead Data Scientist, Marketing & Online (Remote)",
    "yearly_salary": "240000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1066936,
    "company_name": "OpenX",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "sql"
  },
  {
    "job_id": 1066936,
    "company_name": "OpenX",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "python"
  },
  {
    "job_id": 1066936,
    "company_name": "OpenX",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "java"
  },
  {
    "job_id": 1066936,
    "company_name": "OpenX",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "golang"
  },
  {
    "job_id": 1066936,
    "company_name": "OpenX",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "gcp"
  },
  {
    "job_id": 1066936,
    "company_name": "OpenX",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 1556051,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "AI/ML Data Scientist (part time or full time)",
    "yearly_salary": "240000.0",
    "skills": "python"
  },
  {
    "job_id": 1556051,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "AI/ML Data Scientist (part time or full time)",
    "yearly_salary": "240000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 1556051,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "AI/ML Data Scientist (part time or full time)",
    "yearly_salary": "240000.0",
    "skills": "excel"
  },
  {
    "job_id": 1699870,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "sql"
  },
  {
    "job_id": 1699870,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "python"
  },
  {
    "job_id": 1699870,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "scala"
  },
  {
    "job_id": 1699870,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 1699870,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "keras"
  },
  {
    "job_id": 1699870,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 1699870,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "slack"
  },
  {
    "job_id": 152298,
    "company_name": "Home Depot / THD",
    "job_title_short": "Data Scientist",
    "job_title": "Lead Data Scientist - Online Platforms Reinforcement Learning (Remote)",
    "yearly_salary": "240000.0",
    "skills": "sql"
  },
  {
    "job_id": 152298,
    "company_name": "Home Depot / THD",
    "job_title_short": "Data Scientist",
    "job_title": "Lead Data Scientist - Online Platforms Reinforcement Learning (Remote)",
    "yearly_salary": "240000.0",
    "skills": "python"
  },
  {
    "job_id": 152298,
    "company_name": "Home Depot / THD",
    "job_title_short": "Data Scientist",
    "job_title": "Lead Data Scientist - Online Platforms Reinforcement Learning (Remote)",
    "yearly_salary": "240000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 152298,
    "company_name": "Home Depot / THD",
    "job_title_short": "Data Scientist",
    "job_title": "Lead Data Scientist - Online Platforms Reinforcement Learning (Remote)",
    "yearly_salary": "240000.0",
    "skills": "tableau"
  },
  {
    "job_id": 125352,
    "company_name": "MongoDB",
    "job_title_short": "Senior Data Engineer",
    "job_title": "Senior Staff Engineer, Insights and Telemetry (InTel)",
    "yearly_salary": "240000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 125352,
    "company_name": "MongoDB",
    "job_title_short": "Senior Data Engineer",
    "job_title": "Senior Staff Engineer, Insights and Telemetry (InTel)",
    "yearly_salary": "240000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 638196,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "sql"
  },
  {
    "job_id": 638196,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "python"
  },
  {
    "job_id": 638196,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "scala"
  },
  {
    "job_id": 638196,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 638196,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "keras"
  },
  {
    "job_id": 638196,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 638196,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "yearly_salary": "240000.0",
    "skills": "slack"
  },
  {
    "job_id": 1385575,
    "company_name": "21Tech, LLC",
    "job_title_short": "Data Scientist",
    "job_title": "Hardware Data Scientist",
    "yearly_salary": "238080.0",
    "skills": "sql"
  },
  {
    "job_id": 1385575,
    "company_name": "21Tech, LLC",
    "job_title_short": "Data Scientist",
    "job_title": "Hardware Data Scientist",
    "yearly_salary": "238080.0",
    "skills": "python"
  },
  {
    "job_id": 1385575,
    "company_name": "21Tech, LLC",
    "job_title_short": "Data Scientist",
    "job_title": "Hardware Data Scientist",
    "yearly_salary": "238080.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1385575,
    "company_name": "21Tech, LLC",
    "job_title_short": "Data Scientist",
    "job_title": "Hardware Data Scientist",
    "yearly_salary": "238080.0",
    "skills": "pandas"
  },
  {
    "job_id": 1385575,
    "company_name": "21Tech, LLC",
    "job_title_short": "Data Scientist",
    "job_title": "Hardware Data Scientist",
    "yearly_salary": "238080.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 1385575,
    "company_name": "21Tech, LLC",
    "job_title_short": "Data Scientist",
    "job_title": "Hardware Data Scientist",
    "yearly_salary": "238080.0",
    "skills": "looker"
  },
  {
    "job_id": 1385575,
    "company_name": "21Tech, LLC",
    "job_title_short": "Data Scientist",
    "job_title": "Hardware Data Scientist",
    "yearly_salary": "238080.0",
    "skills": "git"
  },
  {
    "job_id": 23312,
    "company_name": "Lawrence Harvey",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science",
    "yearly_salary": "237500.0",
    "skills": "python"
  },
  {
    "job_id": 23312,
    "company_name": "Lawrence Harvey",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science",
    "yearly_salary": "237500.0",
    "skills": "r"
  },
  {
    "job_id": 23312,
    "company_name": "Lawrence Harvey",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science",
    "yearly_salary": "237500.0",
    "skills": "matplotlib"
  },
  {
    "job_id": 23312,
    "company_name": "Lawrence Harvey",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science",
    "yearly_salary": "237500.0",
    "skills": "tableau"
  },
  {
    "job_id": 511797,
    "company_name": "Glocomms",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "237500.0",
    "skills": "sql"
  },
  {
    "job_id": 511797,
    "company_name": "Glocomms",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "237500.0",
    "skills": "python"
  },
  {
    "job_id": 511797,
    "company_name": "Glocomms",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "237500.0",
    "skills": "r"
  },
  {
    "job_id": 1268451,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Safety Insights (San Francisco, CA or Remote)",
    "yearly_salary": "235375.0",
    "skills": "sql"
  },
  {
    "job_id": 1268451,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Safety Insights (San Francisco, CA or Remote)",
    "yearly_salary": "235375.0",
    "skills": "python"
  },
  {
    "job_id": 1268451,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Safety Insights (San Francisco, CA or Remote)",
    "yearly_salary": "235375.0",
    "skills": "r"
  },
  {
    "job_id": 51877,
    "company_name": "Fairmarkit",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science (Remote)",
    "yearly_salary": "235000.0",
    "skills": "sql"
  },
  {
    "job_id": 51877,
    "company_name": "Fairmarkit",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science (Remote)",
    "yearly_salary": "235000.0",
    "skills": "python"
  },
  {
    "job_id": 51877,
    "company_name": "Fairmarkit",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science (Remote)",
    "yearly_salary": "235000.0",
    "skills": "r"
  },
  {
    "job_id": 51877,
    "company_name": "Fairmarkit",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science (Remote)",
    "yearly_salary": "235000.0",
    "skills": "c"
  },
  {
    "job_id": 51877,
    "company_name": "Fairmarkit",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science (Remote)",
    "yearly_salary": "235000.0",
    "skills": "databricks"
  },
  {
    "job_id": 51877,
    "company_name": "Fairmarkit",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science (Remote)",
    "yearly_salary": "235000.0",
    "skills": "spark"
  },
  {
    "job_id": 51877,
    "company_name": "Fairmarkit",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science (Remote)",
    "yearly_salary": "235000.0",
    "skills": "pandas"
  },
  {
    "job_id": 51877,
    "company_name": "Fairmarkit",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science (Remote)",
    "yearly_salary": "235000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 51877,
    "company_name": "Fairmarkit",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science (Remote)",
    "yearly_salary": "235000.0",
    "skills": "airflow"
  },
  {
    "job_id": 51877,
    "company_name": "Fairmarkit",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science (Remote)",
    "yearly_salary": "235000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 51877,
    "company_name": "Fairmarkit",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science (Remote)",
    "yearly_salary": "235000.0",
    "skills": "kafka"
  },
  {
    "job_id": 51877,
    "company_name": "Fairmarkit",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science (Remote)",
    "yearly_salary": "235000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 51877,
    "company_name": "Fairmarkit",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science (Remote)",
    "yearly_salary": "235000.0",
    "skills": "nltk"
  },
  {
    "job_id": 51877,
    "company_name": "Fairmarkit",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science (Remote)",
    "yearly_salary": "235000.0",
    "skills": "tidyverse"
  },
  {
    "job_id": 51877,
    "company_name": "Fairmarkit",
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science (Remote)",
    "yearly_salary": "235000.0",
    "skills": "docker"
  },
  {
    "job_id": 666561,
    "company_name": "Movable Ink",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist (Remote)",
    "yearly_salary": "235000.0",
    "skills": "python"
  },
  {
    "job_id": 666561,
    "company_name": "Movable Ink",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist (Remote)",
    "yearly_salary": "235000.0",
    "skills": "r"
  },
  {
    "job_id": 666561,
    "company_name": "Movable Ink",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist (Remote)",
    "yearly_salary": "235000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 666561,
    "company_name": "Movable Ink",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist (Remote)",
    "yearly_salary": "235000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 666561,
    "company_name": "Movable Ink",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist (Remote)",
    "yearly_salary": "235000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 666561,
    "company_name": "Movable Ink",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist (Remote)",
    "yearly_salary": "235000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 666561,
    "company_name": "Movable Ink",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist (Remote)",
    "yearly_salary": "235000.0",
    "skills": "tableau"
  },
  {
    "job_id": 666561,
    "company_name": "Movable Ink",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist (Remote)",
    "yearly_salary": "235000.0",
    "skills": "looker"
  },
  {
    "job_id": 456144,
    "company_name": "LTK",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager - Event Streaming and Real-Time Analytics",
    "yearly_salary": "235000.0",
    "skills": "sql"
  },
  {
    "job_id": 456144,
    "company_name": "LTK",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager - Event Streaming and Real-Time Analytics",
    "yearly_salary": "235000.0",
    "skills": "python"
  },
  {
    "job_id": 456144,
    "company_name": "LTK",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager - Event Streaming and Real-Time Analytics",
    "yearly_salary": "235000.0",
    "skills": "scala"
  },
  {
    "job_id": 456144,
    "company_name": "LTK",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager - Event Streaming and Real-Time Analytics",
    "yearly_salary": "235000.0",
    "skills": "r"
  },
  {
    "job_id": 456144,
    "company_name": "LTK",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager - Event Streaming and Real-Time Analytics",
    "yearly_salary": "235000.0",
    "skills": "golang"
  },
  {
    "job_id": 456144,
    "company_name": "LTK",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager - Event Streaming and Real-Time Analytics",
    "yearly_salary": "235000.0",
    "skills": "aws"
  },
  {
    "job_id": 456144,
    "company_name": "LTK",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager - Event Streaming and Real-Time Analytics",
    "yearly_salary": "235000.0",
    "skills": "redshift"
  },
  {
    "job_id": 456144,
    "company_name": "LTK",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager - Event Streaming and Real-Time Analytics",
    "yearly_salary": "235000.0",
    "skills": "spark"
  },
  {
    "job_id": 456144,
    "company_name": "LTK",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Manager - Event Streaming and Real-Time Analytics",
    "yearly_salary": "235000.0",
    "skills": "kafka"
  },
  {
    "job_id": 14251,
    "company_name": "Hinge",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "234500.0",
    "skills": "sql"
  },
  {
    "job_id": 14251,
    "company_name": "Hinge",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "234500.0",
    "skills": "python"
  },
  {
    "job_id": 14251,
    "company_name": "Hinge",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "234500.0",
    "skills": "aws"
  },
  {
    "job_id": 14251,
    "company_name": "Hinge",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "234500.0",
    "skills": "bigquery"
  },
  {
    "job_id": 14251,
    "company_name": "Hinge",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "234500.0",
    "skills": "redshift"
  },
  {
    "job_id": 14251,
    "company_name": "Hinge",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "234500.0",
    "skills": "gcp"
  },
  {
    "job_id": 14251,
    "company_name": "Hinge",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "234500.0",
    "skills": "airflow"
  },
  {
    "job_id": 14251,
    "company_name": "Hinge",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "234500.0",
    "skills": "kafka"
  },
  {
    "job_id": 14251,
    "company_name": "Hinge",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "234500.0",
    "skills": "looker"
  },
  {
    "job_id": 14251,
    "company_name": "Hinge",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "234500.0",
    "skills": "terraform"
  },
  {
    "job_id": 14251,
    "company_name": "Hinge",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "234500.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 14251,
    "company_name": "Hinge",
    "job_title_short": "Data Engineer",
    "job_title": "Staff Data Engineer",
    "yearly_salary": "234500.0",
    "skills": "docker"
  },
  {
    "job_id": 11602,
    "company_name": "Meta",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer, Analytics (Generalist)",
    "yearly_salary": "233000.0",
    "skills": "sql"
  },
  {
    "job_id": 11602,
    "company_name": "Meta",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer, Analytics (Generalist)",
    "yearly_salary": "233000.0",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Marketing",
    "yearly_salary": "232423.0",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Marketing",
    "yearly_salary": "232423.0",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Marketing",
    "yearly_salary": "232423.0",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Marketing",
    "yearly_salary": "232423.0",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Marketing",
    "yearly_salary": "232423.0",
    "skills": "tableau"
  },
  {
    "job_id": 1794860,
    "company_name": "Infineon Technologies",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science (El Segundo, California)",
    "yearly_salary": "231657.296875",
    "skills": "sql"
  },
  {
    "job_id": 1794860,
    "company_name": "Infineon Technologies",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science (El Segundo, California)",
    "yearly_salary": "231657.296875",
    "skills": "python"
  },
  {
    "job_id": 1794860,
    "company_name": "Infineon Technologies",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science (El Segundo, California)",
    "yearly_salary": "231657.296875",
    "skills": "r"
  },
  {
    "job_id": 1794860,
    "company_name": "Infineon Technologies",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science (El Segundo, California)",
    "yearly_salary": "231657.296875",
    "skills": "sas"
  },
  {
    "job_id": 1794860,
    "company_name": "Infineon Technologies",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science (El Segundo, California)",
    "yearly_salary": "231657.296875",
    "skills": "spark"
  },
  {
    "job_id": 1794860,
    "company_name": "Infineon Technologies",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science (El Segundo, California)",
    "yearly_salary": "231657.296875",
    "skills": "pyspark"
  },
  {
    "job_id": 1794860,
    "company_name": "Infineon Technologies",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science (El Segundo, California)",
    "yearly_salary": "231657.296875",
    "skills": "hadoop"
  },
  {
    "job_id": 1794860,
    "company_name": "Infineon Technologies",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science (El Segundo, California)",
    "yearly_salary": "231657.296875",
    "skills": "sas"
  },
  {
    "job_id": 1794860,
    "company_name": "Infineon Technologies",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science (El Segundo, California)",
    "yearly_salary": "231657.296875",
    "skills": "spss"
  },
  {
    "job_id": 499503,
    "company_name": "Snowflake",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Industry Senior Principal Sales Engineer, Data Science",
    "yearly_salary": "230625.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1197837,
    "company_name": "Liberty Mutual Insurance",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Director, Data Science - Property",
    "yearly_salary": "230400.5",
    "skills": "sql"
  },
  {
    "job_id": 1197837,
    "company_name": "Liberty Mutual Insurance",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Director, Data Science - Property",
    "yearly_salary": "230400.5",
    "skills": "python"
  },
  {
    "job_id": 1197837,
    "company_name": "Liberty Mutual Insurance",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Director, Data Science - Property",
    "yearly_salary": "230400.5",
    "skills": "r"
  },
  {
    "job_id": 1197837,
    "company_name": "Liberty Mutual Insurance",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Director, Data Science - Property",
    "yearly_salary": "230400.5",
    "skills": "excel"
  },
  {
    "job_id": 1197837,
    "company_name": "Liberty Mutual Insurance",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Director, Data Science - Property",
    "yearly_salary": "230400.5",
    "skills": "powerpoint"
  },
  {
    "job_id": 281284,
    "company_name": "Harnham",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science",
    "yearly_salary": "230000.0",
    "skills": "python"
  },
  {
    "job_id": 281284,
    "company_name": "Harnham",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science",
    "yearly_salary": "230000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 281284,
    "company_name": "Harnham",
    "job_title_short": "Data Scientist",
    "job_title": "Director of Data Science",
    "yearly_salary": "230000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 1258179,
    "company_name": "Reddit",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist, Ads Quality Analytics (Remote)",
    "yearly_salary": "229500.0",
    "skills": "sql"
  },
  {
    "job_id": 1258179,
    "company_name": "Reddit",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist, Ads Quality Analytics (Remote)",
    "yearly_salary": "229500.0",
    "skills": "python"
  },
  {
    "job_id": 1258179,
    "company_name": "Reddit",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist, Ads Quality Analytics (Remote)",
    "yearly_salary": "229500.0",
    "skills": "r"
  },
  {
    "job_id": 1824704,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Ad Formats & Optimization Analytics (Remote)",
    "yearly_salary": "229500.0",
    "skills": "sql"
  },
  {
    "job_id": 1824704,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Ad Formats & Optimization Analytics (Remote)",
    "yearly_salary": "229500.0",
    "skills": "python"
  },
  {
    "job_id": 1824704,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Ad Formats & Optimization Analytics (Remote)",
    "yearly_salary": "229500.0",
    "skills": "r"
  },
  {
    "job_id": 1824704,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Ad Formats & Optimization Analytics (Remote)",
    "yearly_salary": "229500.0",
    "skills": "go"
  },
  {
    "job_id": 1824704,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Ad Formats & Optimization Analytics (Remote)",
    "yearly_salary": "229500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1824704,
    "company_name": "Reddit",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist, Ad Formats & Optimization Analytics (Remote)",
    "yearly_salary": "229500.0",
    "skills": "looker"
  },
  {
    "job_id": 1163221,
    "company_name": "Reddit",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist, Ads Optimization ML (Remote)",
    "yearly_salary": "229000.0",
    "skills": "sql"
  },
  {
    "job_id": 1163221,
    "company_name": "Reddit",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist, Ads Optimization ML (Remote)",
    "yearly_salary": "229000.0",
    "skills": "python"
  },
  {
    "job_id": 1163221,
    "company_name": "Reddit",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist, Ads Optimization ML (Remote)",
    "yearly_salary": "229000.0",
    "skills": "r"
  },
  {
    "job_id": 173752,
    "company_name": "Henry Schein One",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Leader",
    "yearly_salary": "227630.0",
    "skills": "sql"
  },
  {
    "job_id": 173752,
    "company_name": "Henry Schein One",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Leader",
    "yearly_salary": "227630.0",
    "skills": "python"
  },
  {
    "job_id": 173752,
    "company_name": "Henry Schein One",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Leader",
    "yearly_salary": "227630.0",
    "skills": "nosql"
  },
  {
    "job_id": 173752,
    "company_name": "Henry Schein One",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Leader",
    "yearly_salary": "227630.0",
    "skills": "java"
  },
  {
    "job_id": 173752,
    "company_name": "Henry Schein One",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Leader",
    "yearly_salary": "227630.0",
    "skills": "go"
  },
  {
    "job_id": 173752,
    "company_name": "Henry Schein One",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Leader",
    "yearly_salary": "227630.0",
    "skills": "cassandra"
  },
  {
    "job_id": 173752,
    "company_name": "Henry Schein One",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Leader",
    "yearly_salary": "227630.0",
    "skills": "azure"
  },
  {
    "job_id": 173752,
    "company_name": "Henry Schein One",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Leader",
    "yearly_salary": "227630.0",
    "skills": "aws"
  },
  {
    "job_id": 173752,
    "company_name": "Henry Schein One",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Leader",
    "yearly_salary": "227630.0",
    "skills": "snowflake"
  },
  {
    "job_id": 173752,
    "company_name": "Henry Schein One",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Leader",
    "yearly_salary": "227630.0",
    "skills": "spark"
  },
  {
    "job_id": 173752,
    "company_name": "Henry Schein One",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Leader",
    "yearly_salary": "227630.0",
    "skills": "kafka"
  },
  {
    "job_id": 173752,
    "company_name": "Henry Schein One",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Leader",
    "yearly_salary": "227630.0",
    "skills": "gdpr"
  },
  {
    "job_id": 173752,
    "company_name": "Henry Schein One",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Leader",
    "yearly_salary": "227630.0",
    "skills": "splunk"
  },
  {
    "job_id": 173752,
    "company_name": "Henry Schein One",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Leader",
    "yearly_salary": "227630.0",
    "skills": "terraform"
  },
  {
    "job_id": 173752,
    "company_name": "Henry Schein One",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Leader",
    "yearly_salary": "227630.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 173752,
    "company_name": "Henry Schein One",
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineering Leader",
    "yearly_salary": "227630.0",
    "skills": "docker"
  },
  {
    "job_id": 52051,
    "company_name": "Crunchbase",
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist",
    "yearly_salary": "225000.03125",
    "skills": "python"
  },
  {
    "job_id": 236847,
    "company_name": "Cybernetic Search",
    "job_title_short": "Senior Data Engineer",
    "job_title": "Senior Data Engineer",
    "yearly_salary": "225000.0",
    "skills": "python"
  },
  {
    "job_id": 236847,
    "company_name": "Cybernetic Search",
    "job_title_short": "Senior Data Engineer",
    "job_title": "Senior Data Engineer",
    "yearly_salary": "225000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 236847,
    "company_name": "Cybernetic Search",
    "job_title_short": "Senior Data Engineer",
    "job_title": "Senior Data Engineer",
    "yearly_salary": "225000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 236847,
    "company_name": "Cybernetic Search",
    "job_title_short": "Senior Data Engineer",
    "job_title": "Senior Data Engineer",
    "yearly_salary": "225000.0",
    "skills": "azure"
  },
  {
    "job_id": 236847,
    "company_name": "Cybernetic Search",
    "job_title_short": "Senior Data Engineer",
    "job_title": "Senior Data Engineer",
    "yearly_salary": "225000.0",
    "skills": "aws"
  },
  {
    "job_id": 698635,
    "company_name": "FOURKITES",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Scientist (Remote)",
    "yearly_salary": "225000.0",
    "skills": "azure"
  },
  {
    "job_id": 698635,
    "company_name": "FOURKITES",
    "job_title_short": "Data Scientist",
    "job_title": "Chief Data Scientist (Remote)",
    "yearly_salary": "225000.0",
    "skills": "aws"
  },
  {
    "job_id": 202624,
    "company_name": "Understanding Recruitment",
    "job_title_short": "Data Engineer",
    "job_title": "Rust Data Engineer",
    "yearly_salary": "225000.0",
    "skills": "rust"
  },
  {
    "job_id": 1660315,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist (Remote)",
    "yearly_salary": "225000.0",
    "skills": "sql"
  },
  {
    "job_id": 1660315,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist (Remote)",
    "yearly_salary": "225000.0",
    "skills": "python"
  },
  {
    "job_id": 1660315,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist (Remote)",
    "yearly_salary": "225000.0",
    "skills": "scala"
  },
  {
    "job_id": 1660315,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist (Remote)",
    "yearly_salary": "225000.0",
    "skills": "azure"
  },
  {
    "job_id": 1660315,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist (Remote)",
    "yearly_salary": "225000.0",
    "skills": "aws"
  },
  {
    "job_id": 1660315,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist (Remote)",
    "yearly_salary": "225000.0",
    "skills": "gcp"
  },
  {
    "job_id": 1660315,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist (Remote)",
    "yearly_salary": "225000.0",
    "skills": "spark"
  },
  {
    "job_id": 1660315,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist (Remote)",
    "yearly_salary": "225000.0",
    "skills": "pandas"
  },
  {
    "job_id": 1660315,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist (Remote)",
    "yearly_salary": "225000.0",
    "skills": "numpy"
  },
  {
    "job_id": 1660315,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist (Remote)",
    "yearly_salary": "225000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1660315,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist (Remote)",
    "yearly_salary": "225000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 1660315,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist (Remote)",
    "yearly_salary": "225000.0",
    "skills": "matplotlib"
  },
  {
    "job_id": 1660315,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist (Remote)",
    "yearly_salary": "225000.0",
    "skills": "tableau"
  },
  {
    "job_id": 304048,
    "company_name": "Sleeper",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior/Lead Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "sql"
  },
  {
    "job_id": 304048,
    "company_name": "Sleeper",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior/Lead Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "python"
  },
  {
    "job_id": 304048,
    "company_name": "Sleeper",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior/Lead Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "azure"
  },
  {
    "job_id": 304048,
    "company_name": "Sleeper",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior/Lead Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "aws"
  },
  {
    "job_id": 304048,
    "company_name": "Sleeper",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior/Lead Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 304048,
    "company_name": "Sleeper",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior/Lead Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "redshift"
  },
  {
    "job_id": 304048,
    "company_name": "Sleeper",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior/Lead Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 304048,
    "company_name": "Sleeper",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior/Lead Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "gcp"
  },
  {
    "job_id": 304048,
    "company_name": "Sleeper",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior/Lead Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 304048,
    "company_name": "Sleeper",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior/Lead Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 304048,
    "company_name": "Sleeper",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior/Lead Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 212619,
    "company_name": "Campaign.AI",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Sr. Manager, Data Science",
    "yearly_salary": "225000.0",
    "skills": "excel"
  },
  {
    "job_id": 1048813,
    "company_name": "Vericast",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Principal Data Scientist - Remote",
    "yearly_salary": "225000.0",
    "skills": "python"
  },
  {
    "job_id": 1048813,
    "company_name": "Vericast",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Principal Data Scientist - Remote",
    "yearly_salary": "225000.0",
    "skills": "spark"
  },
  {
    "job_id": 778424,
    "company_name": "Zaddy Solutions",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "sql"
  },
  {
    "job_id": 778424,
    "company_name": "Zaddy Solutions",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "python"
  },
  {
    "job_id": 778424,
    "company_name": "Zaddy Solutions",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "r"
  },
  {
    "job_id": 778424,
    "company_name": "Zaddy Solutions",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "julia"
  },
  {
    "job_id": 778424,
    "company_name": "Zaddy Solutions",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "pandas"
  },
  {
    "job_id": 778424,
    "company_name": "Zaddy Solutions",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "numpy"
  },
  {
    "job_id": 778424,
    "company_name": "Zaddy Solutions",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 778424,
    "company_name": "Zaddy Solutions",
    "job_title_short": "Data Scientist",
    "job_title": "Principal Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 991644,
    "company_name": "Averity",
    "job_title_short": "Data Scientist",
    "job_title": "Director Data Science",
    "yearly_salary": "225000.0",
    "skills": "python"
  },
  {
    "job_id": 991644,
    "company_name": "Averity",
    "job_title_short": "Data Scientist",
    "job_title": "Director Data Science",
    "yearly_salary": "225000.0",
    "skills": "azure"
  },
  {
    "job_id": 991644,
    "company_name": "Averity",
    "job_title_short": "Data Scientist",
    "job_title": "Director Data Science",
    "yearly_salary": "225000.0",
    "skills": "databricks"
  },
  {
    "job_id": 991644,
    "company_name": "Averity",
    "job_title_short": "Data Scientist",
    "job_title": "Director Data Science",
    "yearly_salary": "225000.0",
    "skills": "flow"
  },
  {
    "job_id": 1467798,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "sql"
  },
  {
    "job_id": 1467798,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "python"
  },
  {
    "job_id": 1467798,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "scala"
  },
  {
    "job_id": 1467798,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "azure"
  },
  {
    "job_id": 1467798,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "aws"
  },
  {
    "job_id": 1467798,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "gcp"
  },
  {
    "job_id": 1467798,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "spark"
  },
  {
    "job_id": 1467798,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "pandas"
  },
  {
    "job_id": 1467798,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "numpy"
  },
  {
    "job_id": 1467798,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1467798,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 1467798,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "matplotlib"
  },
  {
    "job_id": 1467798,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "tableau"
  },
  {
    "job_id": 259260,
    "company_name": "Vericast",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Principal Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "python"
  },
  {
    "job_id": 259260,
    "company_name": "Vericast",
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Principal Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "spark"
  },
  {
    "job_id": 80900,
    "company_name": "Forsyth Barnes",
    "job_title_short": "Data Scientist",
    "job_title": "Sr. Director of Data Science",
    "yearly_salary": "225000.0",
    "skills": "python"
  },
  {
    "job_id": 80900,
    "company_name": "Forsyth Barnes",
    "job_title_short": "Data Scientist",
    "job_title": "Sr. Director of Data Science",
    "yearly_salary": "225000.0",
    "skills": "aws"
  },
  {
    "job_id": 80900,
    "company_name": "Forsyth Barnes",
    "job_title_short": "Data Scientist",
    "job_title": "Sr. Director of Data Science",
    "yearly_salary": "225000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 1472009,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "sql"
  },
  {
    "job_id": 1472009,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "python"
  },
  {
    "job_id": 1472009,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "scala"
  },
  {
    "job_id": 1472009,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "azure"
  },
  {
    "job_id": 1472009,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "aws"
  },
  {
    "job_id": 1472009,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "gcp"
  },
  {
    "job_id": 1472009,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "spark"
  },
  {
    "job_id": 1472009,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "pandas"
  },
  {
    "job_id": 1472009,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "numpy"
  },
  {
    "job_id": 1472009,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1472009,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 1472009,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "matplotlib"
  },
  {
    "job_id": 1472009,
    "company_name": "Braintrust",
    "job_title_short": "Data Scientist",
    "job_title": "Dovenmuehle Mortgage | Chief Data Scientist",
    "yearly_salary": "225000.0",
    "skills": "tableau"
  },
  {
    "job_id": 352449,
    "company_name": "Primis",
    "job_title_short": "Data Scientist",
    "job_title": "Data Science Vice President",
    "yearly_salary": "225000.0",
    "skills": "sql"
  },
  {
    "job_id": 352449,
    "company_name": "Primis",
    "job_title_short": "Data Scientist",
    "job_title": "Data Science Vice President",
    "yearly_salary": "225000.0",
    "skills": "python"
  }
]
*/
