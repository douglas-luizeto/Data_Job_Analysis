/*
Question: What are the skills required for these top-paying remote jobs? 
- Use the top 10 highest-paying Data Scientist jobs from previous query
- Add the specific skills required for these job roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
       helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        c.name AS company_name,
        salary_year_avg
    FROM
        job_postings_fact j
        LEFT JOIN company_dim c
            ON j.company_id = c.company_id
    WHERE
        job_title_short = 'Data Scientist' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT
    tpj.*,
    s.skills,
    s.type
FROM 
    top_paying_jobs tpj
    INNER JOIN skills_job_dim sj ON tpj.job_id = sj.job_id
    INNER JOIN skills_dim s ON sj.skill_id = s.skill_id;

