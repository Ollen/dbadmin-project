/*
    List all faculty members by rank, department, hiring status,
    department, and area of expertise.
*/

SELECT 
    CONCAT (CONCAT (f.last_name, ','), f.first_name) AS "Faculty Name",
    f.rank AS "Rank",
    f.hire_status AS "Hire Status",
    f.department AS "Department",
    f.college AS "College",
    LISTAGG(e.title, ', ') AS "Expertise"
FROM
    Faculty AS f,
    Faculty_Expertise AS fe,
    Expertise AS e
WHERE
    fe.faculty_id = f.faculty_id AND 
    fe.expert_id = e.expert_id
GROUP BY 
	f.last_name,
	f.first_name,
	f.rank,
	f.hire_status,
	f.department,
	f.college;

/*
    List all faculty members as adviser with their corresponding thesis group
*/

SELECT
    CONCAT (CONCAT (f.last_name, ','), f.first_name) AS "Faculty Adviser", 
    g.thesis_name AS "Thesis Name"
FROM 
    Faculty AS f,
    Thesis_Group AS g
WHERE
    f.faculty_id = g.thesis_adviser

/*
    List all faculty members as panel with the corresponding thesis group
*/
SELECT
    CONCAT (CONCAT (f.last_name, ','), f.first_name) AS "Thesis Panelist", 
    g.thesis_name AS "Thesis Name"
FROM 
    Faculty AS f,
    Thesis_Group AS g,
    Thesis_Panelist AS p
WHERE
    p.group_id = g.group_id AND
    p.faculty_id = f.faculty_id


/*
    List all Students enrolled by program
*/
SELECT
    CONCAT (CONCAT (last_name, ','), first_name) AS "Student Name",
    program AS "PROGRAM"
FROM Student
WHERE program = 'CSE';

SELECT
    CONCAT (CONCAT (last_name, ','), first_name) AS "Student Name",
    program AS "PROGRAM"
FROM Student
WHERE program = 'NE';

/*
    List all Thesis Group and the Students Assigned in a Term
*/
SELECT
    g.thesis_name AS "Thesis Group",
    LISTAGG(s.last_name, ', ') AS "Thesis Members"
FROM 
    Thesis_Group g,
    Class_Offerings co,
    Academic_Year ay,
    Thesis_Members tm,
    Student s
WHERE
    co.class_id = g.class_id AND 
    co.acad_yr_id = ay.acad_yr_id AND
    tm.group_id = g.group_id AND
    tm.student_id = s.student_id AND
    co.term = 3
GROUP BY 1;

/*
    List all thesis group by course
*/
SELECT
    c.name AS "Course",
    g.thesis_name AS "Thesis Group"
FROM
    Thesis_Group AS g,
    Class_Offerings AS co,
    Course AS c
WHERE
    co.course_id = c.course_id AND 
    co.class_id = g.class_id
GROUP BY 1

/*
    Count all thesis group by course
*/
SELECT
    c.name AS "Course",
    COUNT (g.thesis_group) AS "Num. of Thesis Groups"
FROM
    Thesis_Group AS g,
    Class_Offerings AS co,
    Course AS c
WHERE
    co.course_id = c.course_id AND 
    co.class_id = g.class_id
GROUP BY 1