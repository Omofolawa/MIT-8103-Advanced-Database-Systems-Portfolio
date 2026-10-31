SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

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
WHERE l.status = 'Overdue';

GO

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

GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO