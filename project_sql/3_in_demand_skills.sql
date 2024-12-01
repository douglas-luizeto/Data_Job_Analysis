/* 
Question: What are the most in-demand skills for data analysts? 
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst
- Focus on all job postings
- Why? Retrieves the top 5 skills with the highest demand in the job market,
       providing insights into the most valuable skills for job seekers. 
*/

 SELECT
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
ORDER BYa
    number_of_jobs DESC
LIMIT 5;
