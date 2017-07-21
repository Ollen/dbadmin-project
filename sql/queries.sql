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
    LISTAGG(e.name, ', ') AS "Expertise"
FROM
    Faculty AS f,
    Faculty_Expertise AS fe,
    Expertise AS e
WHERE
    fe.faculty_id = f.faculty_id AND 
    fe.expert_id = e.expert_id
GROUP BY 1

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