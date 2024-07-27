-- Exercise 3
-- -----------------------------------------------------
-- View
-- ----------------------------------------------------
-- Create a view to display survey details with calculated scores
CREATE VIEW SurveyResponseScores AS
SELECT
    s.survey_name,
    q.question_text,
    r.response_text,
    CAST(r.response_text AS UNSIGNED) AS score -- Convert response text to numeric score
FROM
    surveys s
JOIN
    questions q ON s.survey_id = q.survey_id
JOIN
    responses r ON q.question_id = r.question_id;
