-- LIBRARY DATABASE
-- Library management database

CREATE DATABASE librarymanagement;

USE librarymanagement;

-- creating a table authors

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);
-- Creating a table called book
CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(100),
    AuthorID INT,
    Genre VARCHAR(50),
    PublishedYear INT,
    Quantity INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
-- creating member table

CREATE TABLE Members (
    MemberID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    MembershipDate DATE
);

-- Creating borrow table

CREATE TABLE Borrowing (
    RecordID INT PRIMARY KEY IDENTITY(1,1),
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Inserting values

INSERT INTO Authors (FirstName, LastName) VALUES
('J.K.', 'Rowling'),
('George', 'Orwell'),
('J.R.R.', 'Tolkien'),
('Isaac', 'Asimov'),
('Agatha', 'Christie'),
('Mark', 'Twain'),
('F. Scott', 'Fitzgerald'),
('Jane', 'Austen'),
('Arthur', 'Conan Doyle'),
('Ernest', 'Hemingway'),
('Leo', 'Tolstoy'),
('Charles', 'Dickens'),
('Mary', 'Shelley'),
('H.G.', 'Wells'),
('Edgar', 'Allan Poe'),
('Herman', 'Melville'),
('Virginia', 'Woolf'),
('Gabriel', 'García Márquez');


INSERT INTO Books (Title, AuthorID, Genre, PublishedYear, Quantity) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 'Fantasy', 1997, 10),
('1984', 2, 'Dystopian', 1949, 5),
('The Hobbit', 3, 'Fantasy', 1937, 7),
('Foundation', 4, 'Science Fiction', 1951, 8),
('Murder on the Orient Express', 5, 'Mystery', 1934, 12),
('The Adventures of Tom Sawyer', 6, 'Adventure', 1876, 10),
('The Great Gatsby', 7, 'Fiction', 1925, 6),
('Pride and Prejudice', 8, 'Romance', 1813, 9),
('Harry Potter and the Chamber of Secrets', 1, 'Fantasy', 1998, 10),
('Animal Farm', 2, 'Dystopian', 1945, 7),
('The Lord of the Rings', 3, 'Fantasy', 1954, 5),
('Sherlock Holmes: A Study in Scarlet', 9, 'Mystery', 1887, 6),
('The Old Man and the Sea', 10, 'Literary Fiction', 1952, 8),
('War and Peace', 11, 'Historical Fiction', 1869, 4),
('A Tale of Two Cities', 12, 'Historical Fiction', 1859, 9),
('Frankenstein', 13, 'Science Fiction', 1818, 7),
('The War of the Worlds', 14, 'Science Fiction', 1898, 5),
('The Raven', 15, 'Poetry', 1845, 6),
('Moby Dick', 16, 'Adventure', 1851, 3),
('To the Lighthouse', 17, 'Literary Fiction', 1927, 5),
('One Hundred Years of Solitude', 18, 'Magical Realism', 1967, 7);

INSERT INTO Members (FirstName, LastName, MembershipDate) VALUES
('John', 'Doe', '2023-01-15'),
('Jane', 'Smith', '2023-02-20'),
('Sam', 'Brown', '2023-03-05'),
('Alice', 'Johnson', '2023-03-15'),
('Bob', 'Williams', '2023-04-10'),
('Charlie', 'Davis', '2023-05-22'),
('Diana', 'Miller', '2023-06-30'),
('Eve', 'Wilson', '2023-07-14'),
('Frank', 'Parker', '2023-03-18'),
('Helen', 'Clark', '2023-04-22'),
('Tom', 'Evans', '2023-05-28'),
('Emily', 'Adams', '2023-06-05'),
('Victor', 'Hughes', '2023-07-19'),
('Grace', 'Turner', '2023-08-01'),
('Liam', 'Martin', '2023-08-08'),
('Sophia', 'Lewis', '2023-08-10'),
('Olivia', 'White', '2023-08-15'),
('James', 'Hall', '2023-08-20');

INSERT INTO Borrowing (MemberID, BookID, BorrowDate, ReturnDate) VALUES
(1, 1, '2023-08-01', NULL),
(2, 2, '2023-08-05', '2023-08-12'),
(3, 3, '2023-08-07', NULL),
(1, 4, '2023-08-10', NULL),  -- Alice Johnson borrowing "Foundation"
(2, 5, '2023-08-12', '2023-08-19'),  -- Bob Williams borrowed and returned "Murder on the Orient Express"
(3, 6, '2023-08-15', NULL),  -- Charlie Davis borrowing "The Adventures of Tom Sawyer"
(4, 7, '2023-08-17', NULL),  -- Diana Miller borrowing "The Great Gatsby"
(5, 8, '2023-08-19', NULL),  -- Eve Wilson borrowing "Pride and Prejudice"
(1, 9, '2023-08-20', NULL),  -- Alice Johnson borrowing "Harry Potter and the Chamber of Secrets"
(2, 10, '2023-08-22', NULL), -- Bob Williams borrowing "Animal Farm"
(3, 11, '2023-08-24', NULL), -- Charlie Davis borrowing "The Lord of the Rings"
(6, 19, '2023-08-11', NULL),  -- Frank Parker borrowing "Sherlock Holmes: A Study in Scarlet"
(7, 20, '2023-08-12', NULL),  -- Helen Clark borrowing "The Old Man and the Sea"
(8, 21, '2023-08-13', NULL),  -- Tom Evans borrowing "War and Peace"
(9, 22, '2023-08-14', '2023-08-19'),  -- Emily Adams borrowed and returned "A Tale of Two Cities"
(10, 23, '2023-08-15', NULL),  -- Victor Hughes borrowing "Frankenstein"
(11, 24, '2023-08-16', NULL),  -- Grace Turner borrowing "The War of the Worlds"
(12, 25, '2023-08-17', NULL),  -- Liam Martin borrowing "The Raven"
(13, 26, '2023-08-18', '2023-08-23'),  -- Sophia Lewis borrowed and returned "Moby Dick"
(14, 27, '2023-08-19', NULL),  -- Olivia White borrowing "To the Lighthouse"
(15, 28, '2023-08-20', NULL),  -- James Hall borrowing "One Hundred Years of Solitude"
(6, 1, '2023-08-21', NULL),  -- Frank Parker borrowing "Harry Potter and the Sorcerer's Stone"
(7, 2, '2023-08-22', NULL),  -- Helen Clark borrowing "1984"
(8, 3, '2023-08-23', NULL),  -- Tom Evans borrowing "The Hobbit"
(9, 4, '2023-08-24', NULL),  -- Emily Adams borrowing "Foundation"
(10, 5, '2023-08-25', NULL), -- Victor Hughes borrowing "Murder on the Orient Express"
(11, 6, '2023-08-26', NULL), -- Grace Turner borrowing "The Adventures of Tom Sawyer"
(12, 7, '2023-08-27', NULL), -- Liam Martin borrowing "The Great Gatsby"
(13, 8, '2023-08-28', NULL), -- Sophia Lewis borrowing "Pride and Prejudice"
(14, 9, '2023-08-29', NULL), -- Olivia White borrowing "Sherlock Holmes: A Study in Scarlet"
(15, 10, '2023-08-30', NULL); -- James Hall borrowing "The Old Man and the Sea"

select * from books;



INSERT INTO Books (Title, AuthorID, Genre, PublishedYear, Quantity) VALUES
('Sherlock Holmes: A Study in Scarlet', 9, 'Mystery', 1887, 6),
('The Old Man and the Sea', 10, 'Literary Fiction', 1952, 8),
('War and Peace', 11, 'Historical Fiction', 1869, 4),
('A Tale of Two Cities', 12, 'Historical Fiction', 1859, 9),
('Frankenstein', 13, 'Science Fiction', 1818, 7),
('The War of the Worlds', 14, 'Science Fiction', 1898, 5),
('The Raven', 15, 'Poetry', 1845, 6),
('Moby Dick', 16, 'Adventure', 1851, 3),
('To the Lighthouse', 17, 'Literary Fiction', 1927, 5),
('One Hundred Years of Solitude', 18, 'Magical Realism', 1967, 7);


SELECT * 
FROM Authors

SELECT *
FROM Books

SELECT *
FROM BorrowingRecords

SELECT *
FROM Members

DROP TABLE BorrowingRecords

SELECT *
FROM Borrowing

-- Find all books borrowed by John.

SELECT CONCAT(m.FirstName, + ' ', + m.LastName) as Full_Name, b.Title
FROM Borrowing as br
JOIN 
Books as b ON br.BookID=b.BookID
JOIN 
Members as m ON br.MemberID=m.MemberID
WHERE m.FirstName LIKE  'John%'

-- List all available books (i.e., not borrowed)

SELECT bookid, title
FROM Books
WHERE BookID NOT IN (SELECT BookID FROM Borrowing);

-- Count the total number of books by each author

SELECT CONCAT(a.FirstName,' ',a.LastName) AS AuthorName,
COUNT(b.BookID) AS TotalBooks
FROM Authors AS a
JOIN Books AS b 
ON a.AuthorID=b.AuthorID
GROUP BY CONCAT(a.FirstName,' ',a.LastName)
ORDER BY TotalBooks DESC;

-- List all books by a genre: (Easy)

SELECT DISTINCT Genre, Title
FROM Books
ORDER BY Genre DESC

-- List members who haven't borrowed any books: (Easy)

SELECT CONCAT(FirstName, + ' ', + LastName) AS Full_Name
FROM Members
WHERE MemberID NOT IN (SELECT bookid FROM Borrowing)

--Find the total number of books available in the library across all titles: (Easy)

SELECT SUM(Quantity) AS total_books 
FROM Books

-- List all authors who have written more than one book in the library: (Easy)

SELECT CONCAT(a.FirstName, + ' ', + a.LastName) as Full_Name, 
COUNT(b.BookID) AS TotalBooks
FROM Authors AS a 
JOIN Books AS b
ON a.AuthorID=b.AuthorID
GROUP BY CONCAT(a.FirstName, + ' ', + a.LastName) 
HAVING COUNT(b.BookID)>1
ORDER BY TotalBooks DESC

-- Find the average number of books borrowed by each member
SELECT 
    ROUND(AVG(BorrowCount), 0) AS AverageBooksBorrowed
FROM (
    SELECT 
        m.MemberID,
        COUNT(*) AS BorrowCount
    FROM Borrowing AS br
    JOIN Members AS m
        ON br.MemberID = m.MemberID
    GROUP BY m.MemberID
) AS temp2;

-- List all books that have never been borrowed: (Easy)

SELECT *
FROM Books AS b
JOIN Borrowing br
ON b.BookID=br.BookID;

SELECT title 
FROM Books 
WHERE BookID NOT IN(SELECT BookID FROM Borrowing);

-- Find the books borrowed within a specific date range (e.g., between '2023-08-01' and '2023-08-15'): (Easy)

SELECT b.Title, br.BorrowDate
FROM Books b JOIN Borrowing br ON b.BookID=br.BookID
WHERE BorrowDate BETWEEN '2023-08-01' and '2023-08-15'
ORDER BY br.BorrowDate DESC;

-- Determine the most popular genre in the library based on the number of books borrowed (Easy)

SELECT b.Genre, COUNT(b.Genre) cnt
FROM Books b 
JOIN Borrowing br
ON b.BookID=br.BookID
GROUP BY b.Genre
ORDER BY cnt DESC

--Find overdue books (books that have not been returned in 30 days): (Intermediate)

SELECT 
    CONCAT(m.FirstName, ' ', m.LastName) AS Full_Name,
    b.Title,
    DATEDIFF(DAY, br.BorrowDate, GETDATE()) AS DaysOverdue
FROM Borrowing AS br
JOIN Books AS b
    ON br.BookID = b.BookID
JOIN Members AS m
    ON br.MemberID = m.MemberID
WHERE br.ReturnDate IS NULL
    AND DATEDIFF(DAY, br.BorrowDate, GETDATE()) > 30
ORDER BY DaysOverdue DESC;

-- Find all books currently borrowed by members (Intermediate)

SELECT CONCAT(m.FirstName, ' ', m.LastName) AS Full_Name, b.Title, br.BorrowDate
FROM Borrowing AS br
JOIN Books AS b ON br.BookID=b.BookID
JOIN Members AS m ON m.MemberID=br.MemberID
WHERE br.ReturnDate IS NULL
ORDER BY br.BorrowDate DESC;

-- Identify members who have borrowed more than one book: (Intermediate)

SELECT CONCAT(m.FirstName, ' ', m.LastName) AS Full_Name, 
		COUNT(br.BookID) AS BooksBorrowed
FROM Borrowing AS br
JOIN Books AS b ON br.BookID=b.BookID
JOIN Members AS m ON m.MemberID=br.MemberID
GROUP BY m.MemberID, CONCAT(m.FirstName, ' ', m.LastName)
HAVING COUNT(br.BookID)>1
ORDER BY BooksBorrowed DESC;

-- List all overdue books along with the days overdue (consider a book overdue if it hasn't been returned within 30 days): (intermediate)

SELECT 
	CONCAT(m.FirstName, ' ', m.LastName) AS Full_Name,
	b.Title, 
	DATEDIFF(DAY, br.BorrowDate, GETDATE()) AS DaysOverdue
FROM Borrowing AS br
JOIN Books AS b
ON br.BookID=b.BookID
JOIN Members m
ON m.MemberID=br.MemberID
WHERE br.ReturnDate IS NULL
AND DATEDIFF(DAY, br.BorrowDate, GETDATE())>30
ORDER BY DaysOverdue DESC;

-- List all books and their corresponding authors that have been borrowed at least twice: (Intermediate)

SELECT b.Title, CONCAT(a.FirstName, ' ', a.LastName) AS AuthorName, 
COUNT(br.BookID) AS TimesBorrowed
FROM Borrowing AS br 
JOIN Books AS b ON br.BookID=b.BookID
JOIN Authors AS a ON a.AuthorID=b.AuthorID
GROUP BY b.BookID, b.Title, a.FirstName, a.LastName
HAVING COUNT(br.BookID) >= 2
ORDER BY TimesBorrowed DESC;


-- Find the difference in the number of books borrowed between two specific members (e.g., 'John Doe' and 'Alice Johnson'): (Intermediate)

SELECT 
    ABS(
        (SELECT COUNT(*) 
         FROM Borrowing br 
         JOIN Members m ON br.MemberID = m.MemberID
         WHERE m.FirstName = 'John' AND m.LastName = 'Doe')
        -
        (SELECT COUNT(*) 
         FROM Borrowing br 
         JOIN Members m ON br.MemberID = m.MemberID
         WHERE m.FirstName = 'Alice' AND m.LastName = 'Johnson')
    ) AS BorrowDifference;

-- Identify all members who borrowed books by a specific author (e.g., 'George Orwell'): (Intermediate)

SELECT DISTINCT CONCAT(m.FirstName, + ' ', + m.LastName) as Full_Name
FROM Members m
JOIN Borrowing br ON m.MemberID=br.MemberID
JOIN Books b ON br.BookID=b.BookID
JOIN Authors a ON a.AuthorID=b.AuthorID
WHERE a.FirstName='George' AND a.LastName='Orwell'

--Find the most borrowed book (Advanced)

SELECT TOP 1 
    b.Title,
    COUNT(*) AS borrow_count
FROM Books AS b
JOIN Borrowing AS br 
    ON b.BookID = br.BookID
GROUP BY b.Title
ORDER BY borrow_count DESC;

-- Identify the member who has borrowed the most books (Advanced)

SELECT TOP 1
	CONCAT(m.FirstName, + ' ', + m.LastName) as Full_Name,
	COUNT(*) AS borrowMostBooks
FROM Members m
JOIN Borrowing br ON m.MemberID=br.MemberID
JOIN Books b ON b.BookID=br.BookID
GROUP BY CONCAT(m.FirstName, + ' ', + m.LastName) 
ORDER BY borrowMostBooks DESC;




