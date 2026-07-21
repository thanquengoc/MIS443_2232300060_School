CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    enrollment_date DATE,
    graduation_year INT,
    major VARCHAR(100)
);

CREATE TABLE professors (
    professor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(100),
    hire_date DATE
);

CREATE TABLE courses (
    course_id VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    department VARCHAR(100),
    professor_id INT REFERENCES professors(professor_id)
);

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id VARCHAR(10) REFERENCES courses(course_id),
    semester VARCHAR(20),
    year INT,
    grade VARCHAR(2)
);
