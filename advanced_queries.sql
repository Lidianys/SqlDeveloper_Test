-- Exercise 2
-- -----------------------------------------------------
-- Advanced Queries
-- ----------------------------------------------------
-- Averange score for each survey
SELECT
    s.survey_name,
ROUND(AVG(CAST(r.response_text AS UNSIGNED)), 1) AS average_score
FROM
    surveys s
JOIN
    questions q ON s.survey_id = q.survey_id
JOIN
    responses r ON q.question_id = r.question_id
GROUP BY
    s.survey_name;
    
-- Top 3 users with the highest average response score
SELECT
    u.user_name,
    ROUND(AVG(CAST(r.response_text AS UNSIGNED)), 1) AS average_score
FROM
    users u
JOIN
    responses r ON u.user_id = r.user_id
GROUP BY
    u.user_name
ORDER BY
    average_score DESC
LIMIT 3;

-- Distribution of responses for each question in a survey 2
SELECT
    q.question_text,
    r.response_text,
    COUNT(*) AS response_count
FROM
    questions q
JOIN
    responses r ON q.question_id = r.question_id
WHERE
    q.survey_id = 2 
GROUP BY
    q.question_text,
    r.response_text
ORDER BY
    q.question_text,
    response_count DESC;