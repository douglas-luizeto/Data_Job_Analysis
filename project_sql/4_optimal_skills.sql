/*
Question: What are the most optimal skills to learn? 
- Identify skills in high demand and associated with high average salaries
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security and offering 
       strategic insights for carrer development.
*/

WITH top_skills AS (    SELECT
        s.skills,
        COUNT(jp.job_id) AS number_of_jobs,
        MIN(jp.salary_year_avg)::INT AS min_salary,
        MAX(jp.salary_year_avg)::INT AS max_salary,
        AVG(jp.salary_year_avg)::INT AS avg_salary,
        STDDEV(jp.salary_year_avg)::INT AS salary_std
    FROM
        job_postings_fact jp
        INNER JOIN skills_job_dim sj ON jp.job_id = sj.job_id
        INNER JOIN skills_dim s ON s.skill_id = sj.skill_id
    WHERE
        jp.job_title_short = 'Data Analyst' AND
        jp.job_work_from_home = TRUE
    GROUP BY
        s.skills
    ORDER BY
        number_of_jobs DESC,
        avg_salary DESC
    LIMIT 50
) 

SELECT
    skills,
    number_of_jobs,
    min_salary,
    avg_salary,
    salary_std
FROM
    top_skills
WHERE 
    number_of_jobs >= 100 AND 
    avg_salary >= 80000
ORDER BY 
    min_salary DESC,
    number_of_jobs DESC
LIMIT 5;