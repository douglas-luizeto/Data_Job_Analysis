/*
Question: What are the skills required for these top-paying remote jobs? 
- Use the top 10 highest-paying Data Scientist jobs from previous query
- Add the specific skills required for these job roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
       helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_skills_ids AS (
    SELECT
        skill_id,
        count(job_id) AS number_of_jobs
    FROM 
        skills_job_dim
    WHERE job_id IN (
        SELECT
            job_id
        FROM
            job_postings_fact j
            LEFT JOIN company_dim c
                ON j.company_id = c.company_id
        WHERE
            job_title_short = 'Data Analyst' AND
            job_location = 'Anywhere' AND
            salary_year_avg IS NOT NULL
        ORDER BY salary_year_avg DESC
        LIMIT 10
    )
    GROUP BY skill_id 
    ORDER BY number_of_jobs DESC
)

SELECT
    s.skill_id,
    s.skills,
    s.type,
    ts.number_of_jobs
FROM 
    top_skills_ids ts
    LEFT JOIN skills_dim s ON ts.skill_id = s.skill_id
ORDER BY 
    ts.number_of_jobs DESC;

