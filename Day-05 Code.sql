SELECT 
    Book.Title,
    Author.Name AS AuthorName
FROM Book
INNER JOIN Author ON Book.AuthorID = Author.AuthorID;

SELECT 
    Author.Name AS AuthorName,
    Book.Title AS BookTitle
FROM Author
LEFT JOIN Book ON Author.AuthorID = Book.AuthorID;

SELECT 
    Author.Name AS AuthorName,
    Book.Title AS BookTitle
FROM Author
RIGHT JOIN Book ON Author.AuthorID = Book.AuthorID;

-- Full join between Author and Book
SELECT 
    Author.Name AS AuthorName,
    Book.Title AS BookTitle
FROM Author
LEFT JOIN Book ON Author.AuthorID = Book.AuthorID

UNION

SELECT 
    Author.Name AS AuthorName,
    Book.Title AS BookTitle
FROM Author
RIGHT JOIN Book ON Author.AuthorID = Book.AuthorID;

SELECT 
    Member.Name AS MemberName,
    Loan.LoanDate,
    Loan.ReturnDate
FROM Loan
INNER JOIN Member ON Loan.MemberID = Member.MemberID;

SELECT 
    Loan.LoanID,
    Member.Name AS MemberName,
    Book.Title AS BookTitle,
    Loan.LoanDate,
    Loan.ReturnDate
FROM Loan
JOIN Member ON Loan.MemberID = Member.MemberID
JOIN Book ON Loan.BookID = Book.BookID;