
--what are the top_paying_jobs 

SELECT
    job_id,
    job_title_short,
    job_location,
    job_schedule_type,
    name AS company_name,
    salary_year_avg,
    job_posted_date

FROM job_postings_fact

LEFT JOIN company_dim 
ON job_postings_fact.company_id = company_dim.company_id

WHERE   
    job_title_short = 'Data Analyst' AND
    job_location = 'Canada' AND
    salary_year_avg IS NOT NULL

ORDER BY
    salary_year_avg DESC

LIMIT 10





WITH top_paying_jobs AS

SELECT
    skills AS skill_name
FROM
    (SELECT
        job_id,
        job_title,
        job_location,
        job_schedule_type,
        name AS company_name,
        salary_year_avg,
        job_posted_date

    FROM job_postings_fact

    LEFT JOIN company_dim 
    ON job_postings_fact.company_id = company_dim.company_id


    WHERE   
        job_title_short = 'Data Analyst' AND
        job_location = 'Canada' AND
        salary_year_avg IS NOT NULL

    ORDER BY
        salary_year_avg DESC

    LIMIT 10) 

LEFT JOIN skill_job_dim ON skill_dim.skill_id = skill_job_dim.skill_id