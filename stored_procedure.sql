-- Exercise 3
-- -----------------------------------------------------
-- Stored Procedure
-- ----------------------------------------------------
DELIMITER //
CREATE PROCEDURE CalculateSurveyScore(IN surveyId INT)
BEGIN
    DECLARE total_score DECIMAL(10,2);
    DECLARE max_score DECIMAL(10,2);
    DECLARE weighted_score DECIMAL(10,2);
    DECLARE weight INT DEFAULT 1; -- Default weight, can be changed

    SET total_score = 0;
    SET max_score = 0;

    SELECT 
        COALESCE(SUM(CAST(r.response_text AS UNSIGNED) * weight), 0) AS total_score,
        COALESCE(SUM(weight * 5), 0) AS max_score
    INTO
        total_score,
        max_score
    FROM
        responses r
    JOIN
        questions q ON r.question_id = q.question_id
    WHERE
        q.survey_id = surveyId;

    IF max_score > 0 THEN
        SET weighted_score = (total_score / max_score) * 100;
    ELSE
        SET weighted_score = 0;
    END IF;
--  The scoring algorithm is based on a scale from 1 to 100.This is done to ensure that the scores are easier to understand and compare.
    SELECT ROUND(weighted_score, 2) AS final_score;
END //
DELIMITER ;