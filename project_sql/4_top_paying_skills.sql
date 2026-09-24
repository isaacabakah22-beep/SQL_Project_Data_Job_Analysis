
--salaries for top skills as a Data Analyst in Canada 

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skillS_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE   job_title_short = 'Data Analyst' AND 
        job_location = 'Canada' AND
        salary_year_avg IS NOT NULL 

GROUP BY
    skills

    ORDER BY
        average_salary DESC

LIMIT 10

/* Quick insights
-Higher-paying roles lean toward data engineering technologies.
The top three are TypeScript ($108,416), Spark ($107,479), and Hadoop ($107,167).
-Cloud and modern data platforms are prominent.
Azure ($101,014) and Databricks ($101,014) both break the $100K level.
-SAP stands out as an enterprise specialization.
-Python sits in the middle of the ranking.

[
  {
    "skills": "typescript",
    "average_salary": "108416"
  },
  {
    "skills": "spark",
    "average_salary": "107479"
  },
  {
    "skills": "hadoop",
    "average_salary": "107167"
  },
  {
    "skills": "azure",
    "average_salary": "101014"
  },
  {
    "skills": "databricks",
    "average_salary": "101014"
  },
  {
    "skills": "sap",
    "average_salary": "99150"
  },
  {
    "skills": "express",
    "average_salary": "99150"
  },
  {
    "skills": "python",
    "average_salary": "94302"
  },
  {
    "skills": "tableau",
    "average_salary": "88550"
  },
  {
    "skills": "sql",
    "average_salary": "88452"
  }
]

*/