-- Exercise 1
-- -----------------------------------------------------
-- Insert sample data 
-- ----------------------------------------------------

-- Insert 10 users 
INSERT INTO users (user_name, user_email) VALUES
('Alice Smith', 'alice.smith@example.com'),
('Bob Johnson', 'bob.johnson@example.com'),
('Carol Davis', 'carol.davis@example.com'),
('David Wilson', 'david.wilson@example.com'),
('Eva Adams', 'eva.adams@example.com'),
('Franklin Harris', 'franklin.harris@example.com'),
('Grace Lee', 'grace.lee@example.com'),
('Henry Clark', 'henry.clark@example.com'),
('Isabel Martinez', 'isabel.martinez@example.com'),
('John Taylor', 'john.taylor@example.com');

-- Insert 3 surveys
INSERT INTO surveys (survey_name, created_at) VALUES
('Customer Satisfaction Survey', NOW()),
('Employee Engagement Survey', NOW()),
('Product Feedback Survey', NOW());

-- Insert 5 questions by each servey
-- "Customer Satisfaction Survey"
INSERT INTO questions (question_text, survey_id) VALUES
('1. How would you rate the overall quality of our customer service (1-5)?', 1),
('2. How satisfied are you with the response time of our customer service (1-5)?', 1),
('3. How would you rate the professionalism of our customer service representatives (1-5)?', 1),
('4. How likely are you to recommend our service to others (1-5)?', 1),
('5. How can we improve our customer service (1-5)?', 1);
-- "Employee Engagement Survey"
INSERT INTO questions (question_text, survey_id) VALUES
('1. How engaged do you feel with your current role (1-5)?', 2),
('2. How would you rate the level of support you receive from your manager (1-5)?', 2),
('3. How satisfied are you with the opportunities for professional development (1-5)?', 2),
('4. How likely are you to recommend our company as a great place to work (1-5)?', 2),
('5. How can we improve employee engagement (1-5)?', 2);
-- "Product Feedback Survey"
INSERT INTO questions (question_text, survey_id) VALUES
('1. How would you rate the overall quality of the product (1-5)?', 3),
('2. How satisfied are you with the product’s features and functionality (1-5)?', 3),
('3. How would you rate the product’s value for money (1-5)?', 3),
('4. How likely are you to purchase this product again (1-5)?', 3),
('5. What improvements would you suggest for this product (1-5)?', 3);

-- Insert responses by question and user
-- Survey 1
INSERT INTO responses (response_text, question_id, user_id) VALUES
('4', 1, 1),
('5', 2, 1),
('3', 3, 1),
('4', 4, 1),
('3', 5, 1),
('5', 1, 2),
('4', 2, 2),
('3', 3, 2),
('4', 4, 2),
('5', 5, 2),
('3', 1, 3),
('4', 2, 3),
('5', 3, 3),
('2', 4, 3),
('4', 5, 3),
('2', 1, 4),
('3', 2, 4),
('4', 3, 4),
('5', 4, 4),
('3', 5, 4),
('5', 1, 5),
('4', 2, 5),
('3', 3, 5),
('4', 4, 5),
('2', 5, 5);
-- Survey 2
INSERT INTO responses (response_text, question_id, user_id) VALUES
('4', 6, 6),
('3', 7, 6),
('5', 8, 6),
('4', 9, 6),
('2', 10, 6),
('3', 6, 7),
('4', 7, 7),
('5', 8, 7),
('3', 9, 7),
('4', 10, 7),
('5', 6, 8),
('4', 7, 8),
('3', 8, 8),
('5', 9, 8),
('4', 10, 8),
('2', 6, 9),
('3', 7, 9),
('4', 8, 9),
('5', 9, 9),
('3', 10, 9),
('4', 6, 10),
('5', 7, 10),
('3', 8, 10),
('2', 9, 10),
('4', 10, 10);
-- Survey 3
INSERT INTO responses (response_text, question_id, user_id) VALUES
('4', 11, 1),
('3', 12, 1),
('5', 13, 1),
('4', 14, 1),
('5', 15, 1),
('3', 11, 2),
('4', 12, 2),
('5', 13, 2),
('3', 14, 2),
('2', 15, 2),
('4', 11, 3),
('5', 12, 3),
('3', 13, 3),
('4', 14, 3),
('5', 15, 3),
('2', 11, 4),
('3', 12, 4),
('4', 13, 4),
('5', 14, 4),
('3', 15, 4),
('5', 11, 5),
('4', 12, 5),
('3', 13, 5),
('5', 14, 5),
('2', 15, 5);