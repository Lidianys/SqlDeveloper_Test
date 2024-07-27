-- Exercise 1
-- -----------------------------------------------------
-- Adding Indexes to tables 
-- ----------------------------------------------------
--  Indexes for users table
CREATE UNIQUE INDEX idx_users_email ON users(user_email);
CREATE INDEX idx_users_user_name ON users(user_name);

--  Indexes for surveys table
CREATE INDEX idx_surveys_survey_name ON surveys(survey_name);
CREATE INDEX idx_surveys_created_at ON surveys(created_at);

--  Index for questions table
CREATE INDEX idx_questions_survey_id ON questions(survey_id);

--  Indexes for responses table
CREATE INDEX idx_responses_question_id ON responses(question_id);
CREATE INDEX idx_responses_user_id ON responses(user_id);

--  Indexes for user_has_serveys table
CREATE INDEX idx_users_has_surveys_users_user_id ON users_has_surveys(users_user_id);
CREATE INDEX idx_users_has_surveys_surveys_survey_id ON users_has_surveys(surveys_survey_id);
