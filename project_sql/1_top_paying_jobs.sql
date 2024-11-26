/*
Question: What are the top-paying data scientist jobs?
- Identify the top 10 highest-paying Data Scientist roles that are available remotely.
- Focuses on job postings with specified salaries.
- Why? Highlight the top-paying oppotunities for Data Scientists, 
*/

SELECT
    job_id,
    job_title,
    c.name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_via,
    job_posted_date
FROM
    job_postings_fact j
    LEFT JOIN company_dim c
        ON j.company_id = c.company_id
WHERE
    job_title_short = 'Data Scientist' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;