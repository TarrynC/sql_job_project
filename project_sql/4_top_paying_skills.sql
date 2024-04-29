/*
Q: What are the top skills based on slary?
    - look at avg salargy associated with each skill
    - focuses on roles with specified salaries
    - Why? Reveal how different skills impact slary levels and identifies most financiall rewarding skills.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
