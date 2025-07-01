SELECT 
    Name,
    (SELECT COUNT(*) 
     FROM Loan 
     WHERE Loan.MemberID = Member.MemberID) AS TotalLoans
FROM Member;

SELECT * 
FROM Book
WHERE BookID IN (
    SELECT BookID FROM Loan
);

SELECT * 
FROM Author A
WHERE EXISTS (
    SELECT 1 FROM Book B 
    WHERE B.AuthorID = A.AuthorID
);

SELECT 
    M.Name,
    L.TotalLoans
FROM Member M
JOIN (
    SELECT MemberID, COUNT(*) AS TotalLoans
    FROM Loan
    GROUP BY MemberID
) L ON M.MemberID = L.MemberID;

SELECT * 
FROM Member M
WHERE (
    SELECT COUNT(*) 
    FROM Loan L 
    WHERE L.MemberID = M.MemberID
) > 1;

SELECT Title
FROM Book
WHERE BookID = (
    SELECT BookID
    FROM Loan
    GROUP BY BookID
    ORDER BY COUNT(*) DESC
    LIMIT 1
);