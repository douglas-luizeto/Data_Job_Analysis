# Introduction

Dive into the data job market! Explore top-paying jobs...

The SQL queries are here: [project_sql folder](/project_sql)

# Background

What this project is about

### Questions I wanted to answer:

1. Top paying jobs?
2. Skills required for these jobs? 
3. Skills most in demand?
4. Most optimal skills

# Tools I Used

- **SQL:** 
- **VSCode:**

# The Analysis

### Top paying Analyst Jobs 
and location, focusing on remote jobs....

```sql
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
```
Comment further

# What I learned

Develop sql skills..

# Conclusions

### insights

### closing thoughts
