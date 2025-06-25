-- Insert Authors
INSERT INTO Author (Name, Country) VALUES 
('J.K. Rowling', 'UK'),
('George Orwell', 'UK'),
('Haruki Murakami', 'Japan'),
('Unknown Author', NULL); -- Country unknown (NULL)

-- Insert Books
INSERT INTO Book (Title, Genre, AuthorID) VALUES 
('1984', 'Dystopian', 2),
('Norwegian Wood', 'Fiction', 3),
('Harry Potter and the Sorcerer''s Stone', 'Fantasy', 1),
('Anonymous Tales', 'Mystery', 4); -- Author with NULL country

-- Insert Members
INSERT INTO Member (Name, Email, MembershipDate) VALUES 
('Alice', 'alice@example.com', '2023-01-15'),
('Bob', 'bob@example.com', '2023-02-01'),
('Charlie', NULL, '2023-03-10'); -- Email is missing (NULL)

-- Insert Loan records
INSERT INTO Loan (BookID, MemberID, LoanDate, ReturnDate) VALUES 
(1, 1, '2024-01-10', '2024-01-25'),
(2, 2, '2024-02-20', NULL),  -- Still not returned
(3, 1, '2024-03-15', '2024-03-30');
-- Update member's email who initially had NULL
UPDATE Member
SET Email = 'charlie@example.com'
WHERE Name = 'Charlie';

-- Change the return date for a book
UPDATE Loan
SET ReturnDate = '2024-02-28'
WHERE BookID = 2 AND MemberID = 2;
-- Delete a loan record (for some reason it was added by mistake)
DELETE FROM Loan
WHERE LoanID = 3;

-- Delete a book with no loans
DELETE FROM Book
WHERE Title = 'Anonymous Tales';



SELECT * FROM Author;

SELECT * FROM Book;

SELECT * FROM Member;

SELECT * FROM Loan;

