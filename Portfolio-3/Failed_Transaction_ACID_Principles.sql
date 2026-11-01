USE city_library;
GO

BEGIN TRY

    BEGIN TRANSACTION;

    INSERT INTO loans
    (
        book_id,
        member_id,
        loan_date,
        due_date,
        status
    )
    VALUES
    (
        1,
        8,
        CAST(GETDATE() AS DATE),
        DATEADD(DAY, 14, CAST(GETDATE() AS DATE)),
        'Active'
    );

    UPDATE books
    SET available_copies = available_copies - 1
    WHERE book_id = 1;

    COMMIT TRANSACTION;

    PRINT 'Borrow transaction completed successfully.';

END TRY

BEGIN CATCH

    ROLLBACK TRANSACTION;

    PRINT 'Transaction failed and was rolled back.';
    PRINT ERROR_MESSAGE();

END CATCH;
GO