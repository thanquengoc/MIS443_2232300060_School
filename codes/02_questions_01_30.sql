-- 1. Return the complete student roster from the students table.
SELECT * FROM students;

-- 2. Return students who are majoring in Computer Science.
SELECT first_name, last_name, graduation_year FROM students
WHERE major = 'Computer Science';

-- 3. Return all courses ordered by credit hours from highest to lowest.
SELECT course_name, credits FROM courses
ORDER BY credits DESC;

-- 4. Return students who are expected to graduate in 2026.
SELECT first_name, last_name, major FROM students
WHERE graduation_year = 2026;

-- 5. Count the total number of courses available.
SELECT COUNT(course_id) AS total_courses FROM courses;

-- 6. Calculate the average number of credits per course.
SELECT AVG(credits) AS average_credits FROM courses;

-- 7. Return students who enrolled after December 31, 2022.
SELECT first_name, last_name, enrollment_date FROM students
WHERE enrollment_date > '2022-12-31';

-- 8. Return professors who work in the Computer Science department.
SELECT first_name, last_name, hire_date FROM professors
WHERE department = 'Computer Science';

-- 9. Return students whose email addresses contain the university.edu domain.
SELECT first_name, last_name, email, major FROM students
WHERE email LIKE '%university.edu%'
ORDER BY last_name;

-- 10. A department administrator wants to see which professors are teaching which courses. Show each professor's name, department, and the courses they are responsible for. Order by professor last name, then course name.
SELECT first_name, last_name, courses.department, course_name, credits FROM professors
LEFT JOIN courses on professors.professor_id = courses.professor_id
ORDER BY professors.last_name, course_name;

-- 11. The curriculum office wants to know how many different academic majors are represented in the student body. Write a query that lists each unique major offered - no duplicates. Exclude students who have not yet declared a major. Order alphabetically.
SELECT DISTINCT major FROM students
WHERE major IS NOT NULL
ORDER BY major ASC;

-- 12. The admissions department needs to identify students who enrolled during the 2022–2023 academic period for a program evaluation. Find all students whose enrollment_date falls within that range (inclusive). Show first name, last name, enrollment_date, and major. Order by enrollment_date, then last name.
SELECT first_name, last_name, enrollment_date, major FROM students
WHERE enrollment_date BETWEEN '2022-01-01' AND '2023-12-31'
ORDER BY enrollment_date, last_name;

-- 13. Academic advisors need to contact students who have not yet chosen a major so they can schedule advising sessions. Find all students whose major has not been declared (stored as NULL). Show first name, last name, and email.
SELECT first_name, last_name, email FROM students
WHERE major IS NULL OR major = 'NULL';

-- 14. Return student names together with their enrolled courses and grades.
SELECT first_name, last_name, course_name, grade FROM students
INNER JOIN enrollments ON students.student_id = enrollments.student_id
INNER JOIN courses ON enrollments.course_id = courses.course_id
ORDER BY students.student_id, enrollment_id;


-- 15. Count the number of students enrolled in each course.
SELECT course_name, COUNT(enrollments.student_id) AS enrollment_count FROM courses
LEFT JOIN enrollments ON courses.course_id = enrollments.course_id
GROUP BY course_name
ORDER BY course_name;