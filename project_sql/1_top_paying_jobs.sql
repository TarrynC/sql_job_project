/*
Q:What are the top paying data analyst jobs?
    - Identify top 10 highest-paying data analyst roles that are available remotely
    - Focus on job postings with specified salaries
    - Why? Highlight top-paying opportunities for data analysts - offering insights into finding the optimal skills for myself to gain
*/

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_country LIKE '%South Africa%' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10