use librarydb;
CREATE VIEW LoanHistory AS
SELECT 
    L.LoanID,
    M.Name AS MemberName,
    B.Title AS BookTitle,
    L.LoanDate,
    L.ReturnDate
FROM Loan L
JOIN Member M ON L.MemberID = M.MemberID
JOIN Book B ON L.BookID = B.BookID;

SELECT * FROM LoanHistory;

CREATE VIEW BooksWithAuthors AS
SELECT 
    B.BookID,
    B.Title,
    B.Genre,
    A.Name AS AuthorName
FROM Book B
JOIN Author A ON B.AuthorID = A.AuthorID;

SELECT Title, AuthorName FROM BooksWithAuthors
WHERE Genre = 'Fiction';

CREATE VIEW MemberLoanCount AS
SELECT 
    M.MemberID,
    M.Name,
    COUNT(L.LoanID) AS TotalLoans
FROM Member M
LEFT JOIN Loan L ON M.MemberID = L.MemberID
GROUP BY M.MemberID, M.Name;

SELECT * FROM MemberLoanCount
WHERE TotalLoans >= 2;

DROP VIEW IF EXISTS MemberLoanCount;