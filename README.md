# SQL Developer Technical Test

## Instructions

This document provides a detailed explanation of how I completed the SQL Developer technical test. It includes descriptions of the tasks, my approach to solving them, and the analysis of each query and optimization technique used.

### Create the Database
First, create a database where the tables and data will be stored. You can do this by executing the following SQL script in your database management tool:

```
CREATE DATABASE survey_db;
USE survey_db;
```

### Task 1: Database Schema Design and Optimization

#### Deliverables

1. SQL scripts to create the tables.
2. SQL scripts to insert sample data into the tables.
3. SQL script to create indexes for optimizing queries.

#### 1. Table Creation

To begin the exercise, I created an EER Diagram to have a clear structure of how my tables would be and the type of relationships that would exist between them. You can find the image of this diagram in the folder img\ERR_Diagram.png.

To create the necessary tables for this exercise, **run the `create_tables.sql` script** in your database management tool to set up the schema.

- **Tables Created**: `users`, `surveys`, `questions`, `responses`, `users_has_surveys`.

##### **Relationships**:

- **`users`** ↔ **`responses`**: One-to-Many
- **`surveys`** ↔ **`questions`**: One-to-Many
- **`questions`** ↔ **`responses`**: One-to-Many
- **`users`** ↔ **`surveys`**: Many-to-Many (via `users_has_surveys`)

#### 2. Insert Sample Data

To populate the tables with sample data for testing, **run the `insert_sample_data.sql` script** in your database management tool.

- **Users**: 10 users with various names and emails.
- **Surveys**: 3 surveys, each with a unique name and creation timestamp:
  - Customer Satisfaction Survey
  - Employee Engagement Survey
  - Product Feedback Survey
- **Questions**: 15 questions total, with 5 questions per survey, covering various topics related to the surveys.
- **Responses**: 30 responses distributed across the 3 surveys, with each response linked to a specific question and user.

#### 3. Create indexes

The indexes are designed to improve query performance by optimizing lookups, joins, and sorting operations on frequently queried columns. Unique indexes ensure data integrity, while non-unique indexes enhance the speed of data retrieval and filtering operations.

To set up the necessary indexes for optimizing query performance, **run the `create_indexes.sql` script** in your database management tool.


**Users Table:**

- `idx_users_email`: Ensures unique email addresses and speeds up lookups by email
- `idx_users_user_name`: Improves performance for queries filtering or sorting by user name.

**Surveys Table:**

- `idx_surveys_survey_name`: Enhances search and filter performance by survey name.
- `idx_surveys_created_at`: Speeds up queries based on the survey creation timestamp.

**Questions Table:**

- `idx_questions_survey_id`: Facilitates faster lookups and joins by survey ID.

**Responses Table:**

- `idx_responses_question_id`: Improves performance for queries based on question ID.
- `idx_responses_user_id`: Accelerates queries filtering or joining by user ID.

**Users_has_Surveys Table:**

- `idx_users_has_surveys_users_user_id`:Speeds up joins and filters based on user ID.
- `idx_users_has_surveys_surveys_survey_id`: Enhances performance for queries involving survey ID.

### Task 2: Query Writing, Optimization, and Advanced Analysis

#### Deliverables

1. Basic Queries.
2. Advanced Queries.

#### 1. Basic Queries.

To execute the basic queries for retrieving survey data, **run the `basic_query.sql` script** in your database management tool.

The query retrieves all responses for `survey_id = 1`, including the survey name, question text, and response text, utilizing indexes to optimize join performance and execution time.

- **Indexes Used**:

  - `idx_questions_survey_id`: Speeds up the join between `surveys` and `questions`.
  - `idx_responses_question_id`: Enhances the join between `questions` and `responses`.

- **Performance**:
  - Efficient joins and filtering by `survey_id` reduce query execution time.
  - Indexed columns ensure quick data retrieval and optimal performance.

This approach effectively ensures quick and efficient performance by using indexed joins to retrieve detailed survey responses.

#### 2. Advanced Queries.

To perform advanced data analysis and retrieve complex insights, **run the `advanced_queries.sql` script** in your database management tool.

1. **Average Score for Each Survey**

   - **Description**: Calculates the average score for each survey, grouped by survey name. It converts `response_text` to a numeric format and rounds the average score to one decimal place.
   - **Optimization**: Utilizes indexes on `survey_id` and `question_id` to speed up the join operations and aggregation.
   - **Performance**: Efficient aggregation and filtering by `survey_name` ensure quick calculation of average scores.

2. **Top 3 Users with the Highest Average Response Score**

   - **Description**: Identifies the top 3 users with the highest average response score across all surveys. It converts `response_text` to numeric format and sorts users by their average score in descending order.
   - **Optimization**: Indexes on `user_id` in the `responses` table facilitate fast retrieval of user response data.
   - **Performance**: Efficient sorting and limiting operations provide a quick way to determine the top users based on average response scores.

3. **Distribution of Responses for Each Question in Survey 2**
   - **Description**: Determines the distribution of responses for each question in survey with `survey_id = 2`. It counts the number of occurrences of each response text for each question.
   - **Optimization**: Uses indexes on `question_id` to speed up the join and aggregation processes.
   - **Performance**: Efficient counting and grouping operations deliver a clear view of response distribution for specific survey questions.

### Task 3: Stored Procedures and Views

#### Deliverables

1. Stored Procedure.
2. View.

#### 1. Stored Procedure.

The CalculateSurveyScore stored procedure calculates the total score for a specified survey by summing the weighted responses. It accepts a survey ID as an input parameter and returns the total score based on predefined weights for each response. This procedure allows for efficient and reusable score calculation across different surveys

To create the necessary stored procedure for calculating survey scores, **run the `stored_procedure.sql` script** in your database management tool. Once the procedure is created, it can be used as needed by calling it with the desired survey ID, for example:

```
call CalculateSurveyScore(2);
```

**Scoring Algorithm:**
The procedure sums the weighted responses where each response is multiplied by its associated question weight.
The weight for each question is used to scale the response value, ensuring that the final score reflects the importance of each question.
The score is calculated on a scale from 1 to 100, providing a standardized measure for comparison.

I Use COALESCE to handle cases where no responses are found, returning a default value of 0.

#### 2. View.
The SurveyResponseScores view provides a comprehensive view of survey responses, including the survey name, question text, response text, and the calculated score for each response. The view consolidates data from the surveys, questions, and responses tables. The score is computed by converting the response_text into a numeric value, assuming responses are recorded in a numeric scale (1-5). This view enables easy retrieval and analysis of survey data with associated scores, facilitating detailed reporting and evaluation of survey results.

To create the view that displays survey details with calculated scores, **run the `view.sql` script** in your database management tool.