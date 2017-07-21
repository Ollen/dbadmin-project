/*
    STRONG ENTITIES:
        - Faculty
        - Student
        - Expertise
        - Course
        - Academic Year
        - Class Offerings
        - Thesis Group
*/

-- Faculty Table Definition
db2 CREATE TABLE Faculty (
    faculty_id  INT             NOT NULL,
    first_name  VARCHAR(50)     NOT NULL,
    last_name   VARCHAR(50)     NOT NULL,
    middle_name VARCHAR(50),    
    email       VARCHAR(254)    NOT NULL,
    hire_status VARCHAR(5)      NOT NULL,
    rank        VARCHAR(30)     NOT NULL,
    department  VARCHAR(5)     NOT NULL,
    college     VARCHAR(5)      NOT NULL 
)
-- Faculty Domains and Constraints
db2 ALTER TABLE Faculty
    ADD PRIMARY KEY (faculty_id)
    ALTER faculty_id 
        SET GENERATED ALWAYS AS IDENTITY
            (START WITH 1, INCREMENT BY 1, NO CACHE)
    ADD UNIQUE (email)
    ADD CONSTRAINT status_domain
        CHECK (hire_status IN ('PT', 'FT'))
    ADD CONSTRAINT rank_domain
        CHECK (rank IN ('instructor', 'asst. prof', 'assoc. prof', 'full prof', 'lecturer', 'asst. proffessional lecturer'))
    ADD CONSTRAINT dept_domain
        CHECK (department IN ('ST', 'CSE', 'NE', 'IT'))

-- Student Table Definition
db2 CREATE TABLE Student (
    student_id  INT             NOT NULL,
    first_name  VARCHAR(50)     NOT NULL,
    last_name   VARCHAR(50)     NOT NULL,
    middle_name VARCHAR(50)     NOT NULL,
    program     VARCHAR(5)      NOT NULL,
    email       VARCHAR(254)    NOT NULL
);
-- Student Domains and Constraints
db2 ALTER TABLE Student
    ADD PRIMARY KEY (student_id)
    ALTER student_id 
        SET GENERATED ALWAYS AS IDENTITY
            (START WITH 1, INCREMENT BY 1, NO CACHE)
    ADD UNIQUE (email)
    ADD CONSTRAINT program_domain 
        CHECK (program IN ('CSE', 'NE'))

-- Expertise Table Definition
db2 CREATE TABLE Expertise (
    expert_id   INT             NOT NULL,
    title       VARCHAR(254)    NOT NULL
);
-- Expertise Domains and Constraints
db2 ALTER TABLE Expertise
    ADD PRIMARY KEY (expert_id)
    ALTER expert_id 
        SET GENERATED ALWAYS AS IDENTITY
            (START WITH 1, INCREMENT BY 1, NO CACHE)
    ADD UNIQUE (title)


-- Course Table Definition
db2 CREATE TABLE Course(
course_id INT	    NOT NULL,
name VARCHAR(30)	NOT NULL
);
-- Course Domains and Constraints
db2 ALTER TABLE Course
    ADD PRIMARY KEY (course_id)
    ALTER course_id
        SET GENERATED ALWAYS AS IDENTITY
            (START WITH 1, INCREMENT BY 1, NO CACHE)


-- Academic_Year Table Definition
db2 CREATE TABLE Academic_Year(
    acad_yr_id  INT 	        NOT NULL,
    year        VARCHAR(15)	    NOT NULL,
    term        INT	            NOT NULL
);
-- Academic_Year Domains and Constraints
db2 ALTER TABLE Academic_Year
    ADD PRIMARY KEY (acad_yr_id)
    ALTER acad_yr_id
        SET GENERATED ALWAYS AS IDENTITY
            (START WITH 1, INCREMENT BY 1, NO CACHE)

-- Class_Offerings Table Definition
db2 CREATE TABLE Class_Offerings(
class_id    INT     NOT NULL,
course_id   INT     NOT NULL,
acad_yr_id  INT 	NOT NULL
);
-- Class_Offerings Domains and Constraints
db2 ALTER TABLE Class_Offerings
    ADD PRIMARY KEY (class_id)
    ALTER class_id
        SET GENERATED ALWAYS AS IDENTITY
            (START WITH 1, INCREMENT BY 1, NO CACHE)
    ADD FOREIGN KEY (course_id) 
        REFERENCES Course (course_id) ON DELETE CASCADE
    ADD FOREIGN KEY(acad_yr_id) 
        REFERENCES Academic_Year (acad_yr_id) ON DELETE CASCADE

-- Thesis_Group Table Definition
db2 CREATE TABLE Thesis_Group(
    group_id        INT NOT NULL,
    class_id        INT NOT NULL,
    thesis_adviser  INT NOT NULL,
    thesis_name     VARCHAR(254) NOT NULL
)
-- Thesis_Group Domains and Constraints
db2 ALTER TABLE Thesis_Group
    ADD PRIMARY KEY (group_id)
    ALTER group_id
        SET GENERATED ALWAYS AS IDENTITY
            (START WITH 1, INCREMENT BY 1, NO CACHE)
    ADD FOREIGN KEY (class_id) 
        REFERENCES Class_Offerings (class_id) ON DELETE CASCADE
    ADD FOREIGN KEY (thesis_adviser) 
        REFERENCES Faculty (faculty_id) ON DELETE CASCADE
