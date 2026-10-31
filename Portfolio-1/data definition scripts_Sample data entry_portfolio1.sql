USE city_library;
GO

/* ==========================
   AUTHORS
   ========================== */

INSERT INTO authors
(first_name, last_name, nationality)
VALUES
('Chinua', 'Achebe', 'Nigerian'),
('Ngugi', 'Wa Thiongo', 'Kenyan'),
('Nadine', 'Gordimer', 'South African'),
('Mariama', 'Ba', 'Senegalese');
GO


/* ==========================
   PUBLISHERS
   ========================== */

INSERT INTO publishers
(name, address, phone)
VALUES
('Heinemann Africa', 'Ibadan, Nigeria', '+2348011111111'),
('East African Educational Publishers', 'Nairobi, Kenya', '+254701234567'),
('Penguin Random House SA', 'Cape Town, South Africa', '+27211234567');
GO


/* ==========================
   BOOKS
   ========================== */

INSERT INTO books
(
    isbn,
    title,
    author_id,
    publisher_id,
    publication_year,
    genre,
    total_copies,
    available_copies
)
VALUES
('9780435905255', 'Things Fall Apart', 1, 1, 1958, 'Fiction', 8, 5),
('9780435905484', 'No Longer at Ease', 1, 1, 1960, 'Fiction', 5, 3),
('9780435909086', 'Petals of Blood', 2, 2, 1977, 'Fiction', 6, 2),
('9780141186788', 'Julys People', 3, 3, 1981, 'Fiction', 4, 1),
('9780435905460', 'So Long a Letter', 4, 1, 1979, 'Literature', 5, 4);
GO


/* ==========================
   MEMBERS
   ========================== */

INSERT INTO members
(
    full_name,
    email,
    phone,
    join_date,
    membership_type,
    is_active
)
VALUES
('Adebayo Adewale',
 'adebayo.adewale@email.com',
 '+2348031111111',
 '2024-01-15',
 'Premium',
 1),

('Ngozi Okafor',
 'ngozi.okafor@email.com',
 '+2348032222222',
 '2024-02-01',
 'Standard',
 1),

('Kwame Mensah',
 'kwame.mensah@email.com',
 '+233244444444',
 '2024-03-12',
 'Student',
 1),

('Thandi Ndlovu',
 'thandi.ndlovu@email.com',
 '+27711234567',
 '2024-06-20',
 'Standard',
 1);
GO


/* ==========================
   LOANS
   ========================== */

INSERT INTO loans
(
    book_id,
    member_id,
    loan_date,
    due_date,
    return_date,
    status
)
VALUES
(1, 1, '2025-01-10', '2025-01-24', '2025-01-20', 'Returned'),

(2, 2, '2025-02-01', '2025-02-15', NULL, 'Overdue'),

(3, 3, '2025-02-10', '2025-02-24', NULL, 'Active'),

(4, 4, '2025-03-01', '2025-03-15', NULL, 'Overdue'),

(5, 2, '2025-03-05', '2025-03-19', NULL, 'Active');
GO


/* ==========================
   FINES
   ========================== */

INSERT INTO fines
(
    loan_id,
    amount,
    issued_date,
    paid_status
)
VALUES
(2, 5.00, '2025-02-16', 0),
(4, 2.50, '2025-03-16', 0);
GO


/* ==========================
   RESERVATIONS
   ========================== */

INSERT INTO reservations
(
    book_id,
    member_id,
    status
)
VALUES
(1, 3, 'Pending'),
(3, 4, 'Pending');
GO