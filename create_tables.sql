-- Exercise 1
-- -----------------------------------------------------
-- Creation of tables
-- ----------------------------------------------------
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(45) NOT NULL,
    user_email VARCHAR(45) NOT NULL
);

CREATE TABLE surveys (
    survey_id INT AUTO_INCREMENT PRIMARY KEY,
    survey_name VARCHAR(45) NOT NULL,
    created_at TIMESTAMP NOT NULL
);

CREATE TABLE questions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    question_text VARCHAR(200) NOT NULL,
    survey_id INT,
    FOREIGN KEY (survey_id) REFERENCES surveys(survey_id)
);

CREATE TABLE responses (
    response_id INT AUTO_INCREMENT PRIMARY KEY,
    response_text LONGTEXT NOT NULL,
    question_id INT,
    user_id INT,
    FOREIGN KEY (question_id) REFERENCES questions(question_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE users_has_surveys (
    users_user_id INT,
    surveys_survey_id INT,
    PRIMARY KEY (users_user_id, surveys_survey_id),
    FOREIGN KEY (users_user_id) REFERENCES users(user_id),
    FOREIGN KEY (surveys_survey_id) REFERENCES surveys(survey_id)
);
