
-- 5 top-demanded skills for a Full-time Data Analyst in Canada  

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skillS_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE   job_title_short = 'Data Analyst' AND 
        job_location = 'Canada' AND
        job_schedule_type = 'Full-time'

GROUP BY
    skills

    ORDER BY
        demand_count

LIMIT 5