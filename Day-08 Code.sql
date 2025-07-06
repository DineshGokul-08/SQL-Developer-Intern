Use librarydb;

DELIMITER //

CREATE PROCEDURE GetLoansByMember(IN memberName VARCHAR(100))
BEGIN
    SELECT 
        M.Name AS MemberName,
        B.Title AS BookTitle,
        L.LoanDate,
        L.ReturnDate
    FROM Loan L
    JOIN Member M ON L.MemberID = M.MemberID
    JOIN Book B ON L.BookID = B.BookID
    WHERE M.Name = memberName;
END //

DELIMITER ;

CALL GetLoansByMember('Alice Johnson');

DELIMITER //

CREATE FUNCTION CountLoansByMember(memID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM Loan
    WHERE MemberID = memID;
    RETURN total;
END //

DELIMITER ;

SELECT Name, CountLoansByMember(MemberID) AS TotalLoans
FROM Member;

DROP PROCEDURE IF EXISTS GetLoansByMember;
DROP FUNCTION IF EXISTS CountLoansByMember;