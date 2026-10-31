
-- This script below deletes any instance of City_Library Database that exsists on the server management system
DROP DATABASE IF EXISTS city_library;

-- This line creates the new database
CREATE DATABASE city_library;

--This line assigns city_library as databae in use, hence ongoing transations will be in this database
USE city_library;

-- As idetified in the conceptual data model, we need to create tables for authors, publishes, books, members, loans, fines and reservations

-- Authors Table
CREATE TABLE authors (
    author_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    nationality VARCHAR(50)
);

-- Publishers Table
CREATE TABLE publishers (
    publisher_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    address VARCHAR(200),
    phone VARCHAR(20)
);

-- Books Table
CREATE TABLE books (
    book_id INT IDENTITY(1,1) PRIMARY KEY,
    isbn VARCHAR(13) NOT NULL UNIQUE,
    title VARCHAR(200) NOT NULL,
    author_id INT NOT NULL,
    publisher_id INT NULL,
    publication_year INT,
    genre VARCHAR(50),
    total_copies INT DEFAULT 1 CHECK (total_copies >= 0),
    available_copies INT DEFAULT 1 CHECK (available_copies >= 0),

    CONSTRAINT FK_Books_Authors
        FOREIGN KEY (author_id)
        REFERENCES authors(author_id),

    CONSTRAINT FK_Books_Publishers
        FOREIGN KEY (publisher_id)
        REFERENCES publishers(publisher_id),

    CONSTRAINT CHK_Books_AvailableCopies
        CHECK (available_copies <= total_copies)
);

-- Members Table
CREATE TABLE members (
    member_id INT IDENTITY(1,1) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    join_date DATE NOT NULL,

    membership_type VARCHAR(20)
        CONSTRAINT CHK_Members_MembershipType
        CHECK (membership_type IN ('Standard', 'Premium', 'Student'))
        DEFAULT 'Standard',

    is_active BIT NOT NULL DEFAULT 1
);

-- Loans Table
CREATE TABLE loans (
    loan_id INT IDENTITY(1,1) PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE NULL,

    status VARCHAR(20)
        CONSTRAINT CHK_Loans_Status
        CHECK (status IN ('Active', 'Returned', 'Overdue'))
        DEFAULT 'Active',

    CONSTRAINT FK_Loans_Books
        FOREIGN KEY (book_id)
        REFERENCES books(book_id),

    CONSTRAINT FK_Loans_Members
        FOREIGN KEY (member_id)
        REFERENCES members(member_id),

    CONSTRAINT CHK_Loans_Dates
        CHECK (due_date > loan_date)
);

-- Fines Table
CREATE TABLE fines (
    fine_id INT IDENTITY(1,1) PRIMARY KEY,
    loan_id INT NOT NULL UNIQUE,
    amount DECIMAL(8,2) NOT NULL
        CHECK (amount >= 0),
    issued_date DATE NOT NULL,
    paid_status BIT NOT NULL DEFAULT 0,

    CONSTRAINT FK_Fines_Loans
        FOREIGN KEY (loan_id)
        REFERENCES loans(loan_id)
);

-- Reservations Table
CREATE TABLE reservations (
    reservation_id INT IDENTITY(1,1) PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    reservation_date DATETIME DEFAULT GETDATE(),

    status VARCHAR(20)
        CONSTRAINT CHK_Reservations_Status
        CHECK (status IN ('Pending', 'Fulfilled', 'Cancelled'))
        DEFAULT 'Pending',

    CONSTRAINT FK_Reservations_Books
        FOREIGN KEY (book_id)
        REFERENCES books(book_id),

    CONSTRAINT FK_Reservations_Members
        FOREIGN KEY (member_id)
        REFERENCES members(member_id)
);