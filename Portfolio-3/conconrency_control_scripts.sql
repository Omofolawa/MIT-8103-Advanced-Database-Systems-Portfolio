-- Session A --
USE city_library;
GO

BEGIN TRANSACTION;

SELECT available_copies
FROM books WITH (UPDLOCK)
WHERE book_id = 1;

-- Keep transaction open

UPDATE books
SET available_copies = 0
WHERE book_id = 2;

COMMIT TRANSACTION;
GO

-- Session B --
USE city_library;
GO

BEGIN TRANSACTION;

SELECT available_copies
FROM books WITH (UPDLOCK)
WHERE book_id = 2;

-- This query waits until Session A
-- commits or rolls back

ROLLBACK TRANSACTION;
GO