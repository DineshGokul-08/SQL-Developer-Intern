USE librarydb;
SELECT 
    Author.AuthorID,
    Author.Name AS AuthorName,
    COUNT(Book.BookID) AS BookCount
FROM Author
LEFT JOIN Book ON Author.AuthorID = Book.AuthorID
GROUP BY Author.AuthorID, Author.Name;

SELECT 
    Member.MemberID,
    Member.Name AS MemberName,
    COUNT(Loan.LoanID) AS TotalLoans
FROM Member
LEFT JOIN Loan ON Member.MemberID = Loan.MemberID
GROUP BY Member.MemberID, Member.Name;

SELECT 
    AVG(BookCount) AS AvgLoansPerMember
FROM (
    SELECT MemberID, COUNT(*) AS BookCount
    FROM Loan
    GROUP BY MemberID
) AS SubQuery;

SELECT 
    Member.Name,
    COUNT(Loan.LoanID) AS TotalBooksLoaned
FROM Member
JOIN Loan ON Member.MemberID = Loan.MemberID
GROUP BY Member.Name;

SELECT 
    Member.Name,
    COUNT(Loan.LoanID) AS LoanCount
FROM Member
JOIN Loan ON Member.MemberID = Loan.MemberID
GROUP BY Member.Name
HAVING COUNT(Loan.LoanID) > 1;

SELECT 
    Book.Genre,
    COUNT(Loan.LoanID) AS LoansByGenre
FROM Book
JOIN Loan ON Book.BookID = Loan.BookID
GROUP BY Book.Genre;
