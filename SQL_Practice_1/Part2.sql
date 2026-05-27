-- 1. Employee names in alphabetical order
SELECT Name
FROM Employee
ORDER BY Name;

-- 2. Employees with salary > 2000 and months < 10
SELECT Name
FROM Employee
WHERE Salary > 2000
  AND Months < 10
ORDER BY employee_id;

-- 3. Cities in Africa
SELECT c.Name
FROM CITY c
JOIN COUNTRY co
ON c.CountryCode = co.Code
WHERE co.Continent = 'Africa';

-- 4. Average population for each continent
SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population))
FROM CITY
JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;

-- 5. Students with marks > 75 ordered by last 3 characters
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID;

-- 6. Total score of hackers
SELECT h.hacker_id, h.name, SUM(best_scores.max_score) AS total_score
FROM Hackers h
JOIN (
    SELECT hacker_id, challenge_id, MAX(score) AS max_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
) best_scores
ON h.hacker_id = best_scores.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(best_scores.max_score) > 0
ORDER BY total_score DESC, h.hacker_id;

-- 7. Students and Grades report
SELECT
    CASE
        WHEN g.Grade < 8 THEN NULL
        ELSE s.Name
    END AS Name,
    g.Grade,
    s.Marks
FROM Students s
JOIN Grades g
ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY
    g.Grade DESC,
    s.Name,
    s.Marks;