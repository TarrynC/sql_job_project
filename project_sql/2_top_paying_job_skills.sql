/*
Q: What are the skills required for top paying data analyst jobs?
    - Use top 10 highest-paying data analyst jobs from 1st query
    - Add skills required for these jobs
    - Why? Provides insights into which skills high-paying jobs demand, 
    helping job seekers attain skills to get a high paying job
*/

WITH top_paying_jobs AS (

    SELECT 
        job_id,
        job_title,
        job_location,
        salary_year_avg,
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

)

SELECT 
    top_paying_jobs.*,
    skills 
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY
    salary_year_avg DESC