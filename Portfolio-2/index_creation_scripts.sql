/* =====================================================
   INDEX 1
   Optimizes Query 1 (Overdue Loans)
   ===================================================== */
CREATE NONCLUSTERED INDEX idx_loans_status
ON loans(status);
GO

/* =====================================================
   INDEX 2
   Optimizes Query 2 (Most Borrowed Books)
   ===================================================== */
CREATE NONCLUSTERED INDEX idx_loans_bookid
ON loans(book_id);
GO

/* =====================================================
   INDEX 3
   Optimizes Query 2 Filtering by Loan Date
   ===================================================== */
CREATE NONCLUSTERED INDEX idx_loans_loandate
ON loans(loan_date);
GO

/* =====================================================
   INDEX 4
   Optimizes Joins Between Loans and Members
   ===================================================== */
CREATE NONCLUSTERED INDEX idx_loans_memberid
ON loans(member_id);
GO

/* =====================================================
   INDEX 5
   Optimizes Book Searches and Author Joins
   ===================================================== */
CREATE NONCLUSTERED INDEX idx_books_authorid
ON books(author_id);
GO

/* =====================================================
   INDEX 6
   Optimizes Reservation Queries
   ===================================================== */
CREATE NONCLUSTERED INDEX idx_reservations_status
ON reservations(status);
GO