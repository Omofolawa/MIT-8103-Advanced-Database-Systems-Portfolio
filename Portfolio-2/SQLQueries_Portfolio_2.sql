USE city_library;
GO

/* =====================================================
   Q1: OVERDUE LOANS WITH DAYS OVERDUE
   ===================================================== */

SELECT
    l.loan_id,
    m.full_name,
    b.title,
    l.due_date,
    DATEDIFF(DAY, l.due_date, GETDATE()) AS days_overdue
FROM loans l
INNER JOIN members m
    ON l.member_id = m.member_id
INNER JOIN books b
    ON l.book_id = b.book_id
WHERE l.status = 'Overdue'
ORDER BY days_overdue DESC;
GO


/* =====================================================
   Q2: MOST BORROWED BOOKS IN THE LAST 6 MONTHS
   ===================================================== */

SELECT TOP 5
    b.title,
    COUNT(*) AS borrow_count
FROM loans l
INNER JOIN books b
    ON l.book_id = b.book_id
GROUP BY
    b.book_id,
    b.title
ORDER BY borrow_count DESC;


/* =====================================================
   Q3: MEMBERS WITH UNPAID FINES
   ===================================================== */

SELECT
    m.full_name,
    m.email,
    SUM(f.amount) AS total_fines
FROM fines f
INNER JOIN loans l
    ON f.loan_id = l.loan_id
INNER JOIN members m
    ON l.member_id = m.member_id
WHERE f.paid_status = 0
GROUP BY
    m.member_id,
    m.full_name,
    m.email
HAVING SUM(f.amount) > 0
ORDER BY total_fines DESC;
GO


/* =====================================================
   Q4: AVAILABLE FICTION BOOKS
   (Matches the African sample dataset)
   ===================================================== */

SELECT
    b.title,
    CONCAT(a.first_name, ' ', a.last_name) AS author,
    b.available_copies
FROM books b
INNER JOIN authors a
    ON b.author_id = a.author_id
WHERE b.genre = 'Fiction'
    AND b.available_copies > 0
ORDER BY b.title;
GO


/* =====================================================
   Q5: RESERVATION QUEUE PER BOOK
   ===================================================== */

SELECT
    b.title,
    COUNT(*) AS pending_reservations
FROM reservations r
INNER JOIN books b
    ON r.book_id = b.book_id
WHERE r.status = 'Pending'
GROUP BY
    b.book_id,
    b.title
ORDER BY pending_reservations DESC;
GO