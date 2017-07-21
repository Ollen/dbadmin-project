/*
    Weak Entities (Association):
        - Enroll
        - Thesis Panelists
        - Thesis Members
        - Thesis Expertise
        - Faculty Expertise
*/

-- Enroll Table Definition
db2 CREATE TABLE Enroll(
    student_id  INT NOT NULL,
    class_id    INT	NOT NULL,
)
-- Enroll Domains and Constraints
db2 ALTER TABLE Enroll
    ADD FOREIGN KEY (student_id) 
        REFERENCES Student (student_id) ON DELETE CASCADE
    ADD FOREIGN KEY (class_id) 
        REFERENCES Class_Offerings (class_id) ON DELETE CASCADE

-- Thesis_Expertise Table Definition
db2 CREATE TABLE Thesis_Expertise(
    group_id    INT NOT NULL,
    expert_id   INT NOT NULL
)
-- Thesis_Expertise Domains and Constraints
db2 ALTER TABLE Thesis_Expertise
    ADD FOREIGN KEY (group_id) 
        REFERENCES Thesis_Group (group_id) ON DELETE CASCADE
    ADD FOREIGN KEY (expert_id) 
        REFERENCES Expertise (expert_id) ON DELETE CASCADE

-- Faculty_Expertise Table Definition
db2 CREATE TABLE Faculty_Expertise (
    faculty_id  INT     NOT NULL,
    expert_id   INT     NOT NULL
);
-- Faculty_Exoertuse Domains and Constraints
db2 ALTER TABLE Faculty_Expertise
    ADD FOREIGN KEY (faculty_id)
        REFERENCES Faculty (faculty_id) ON DELETE CASCADE
    Add FOREIGN KEY (expert_id)
        REFERENCES Expertise (expert_id) ON DELETE CASCADE

-- Thesis_Panelists Table Definition
db2 CREATE TABLE Thesis_Panelists (
    group_id    INT     NOT NULL,
    faculty_id  INT     NOT NULL
)
-- Thesis_Panelists Domains and Constraints
db2 ALTER TABLE Thesis_Panelists
    ADD FOREIGN KEY (group_id)
        REFERENCES Thesis_Group (group_id) ON DELETE CASCADE
    ADD FOREIGN KEY (faculty_id)
        REFERENCES Faculty (faculty_id) ON DELETE CASCADE

-- Thesis_Members Table Definition
db2 CREATE TABLE Thesis_Members (
    group_id    INT     NOT NULL,
    student_id  INT     NOT NULL
);
-- Thesis_Members Domains and Constraints
db2 ALTER TABLE Thesis_Members
    ADD FOREIGN KEY (group_id)
        REFERENCES Thesis_Group (group_id) ON DELETE CASCADE
    ADD FOREIGN KEY (student_id)
        REFERENCES Student (group_id) ON DELETE CASCADE