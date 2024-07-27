-- Exercise 2
-- -----------------------------------------------------
-- Basic Queries
-- ----------------------------------------------------
SELECT
    s.survey_name,
    q.question_text,
    r.response_text
FROM
    surveys s
JOIN
    questions q ON s.survey_id = q.survey_id
JOIN
    responses r ON q.question_id = r.question_id
WHERE
    s.survey_id = 1; 