/*
Q: What are the most in demand skills for data analysts?
    - join job postings to table similar to query 2 (already narrowed it down a bit with python code for 2)
    - Identify top 5 in-demand skills for a data analyst
    - focus on all (not just location based) job posts
    - Why? Insights into what the most valuable skills for aspiring data analyst are
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5