use librarydb;

-- Select everything from each table
SELECT * FROM Author;
SELECT * FROM Book;
SELECT * FROM Member;
SELECT * FROM Loan;

-- Select specific columns
SELECT Name, Country FROM Author;
SELECT Title, Genre FROM Book;

-- Get all authors from the UK
SELECT * FROM Author
WHERE Country = 'UK';

-- Get books with genre Fiction or Mystery
SELECT * FROM Book
WHERE Genre = 'Fiction' OR Genre = 'Mystery';

-- Get members who joined in or after Feb 2023
SELECT * FROM Member
WHERE MembershipDate >= '2023-02-01';

-- Get members with name starting with 'A'
SELECT * FROM Member
WHERE Name LIKE 'A%';

-- Get loans made between two dates
SELECT * FROM Loan
WHERE LoanDate BETWEEN '2024-01-01' AND '2024-03-31';

-- Get books ordered by Title
SELECT * FROM Book
ORDER BY Title ASC;

-- Get members ordered by MembershipDate (latest first)
SELECT * FROM Member
ORDER BY MembershipDate DESC;

-- Show top 2 most recent members
SELECT * FROM Member
ORDER BY MembershipDate DESC
LIMIT 2;

-- Show 3 books by ascending BookID
SELECT * FROM Book
ORDER BY BookID ASC
LIMIT 3;

-- Get all books by authors from the UK
SELECT Book.Title, Author.Name
FROM Book
JOIN Author ON Book.AuthorID = Author.AuthorID
WHERE Author.Country = 'UK';


