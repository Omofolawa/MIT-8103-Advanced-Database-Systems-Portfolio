# Portfolio 1: Database Design and Modelling

## Case Study
City Central Library is a public library service operating one central branch with a shared collection. The library lends physical books to registered members and manages the resulting loans, overdue fines, and reservations. The database supports four groups of users: librarians, who issue and receive loans and record fines; members, who search the catalogue, borrow books, and place reservations; administrators, who manage membership records and produce reports; and management, who require summary reporting on borrowing trends and outstanding fines.

The major data held are authors, publishers, books (titles and physical copy counts), members, loans, fines, and reservations. The key operations the database must support are: register and maintain members; catalogue books with author and publisher details; issue a loan and decrement availability; receive a return and increment availability; calculate and record an overdue fine; place and fulfil a reservation; and search the catalogue by title, author, or genre.

Modelling scope and simplification assumptions (state these — they are what makes the model defensible):

Each book title is attributed to one author. (Real titles may have co-authors; this is deliberately simplified to a 1:M relationship. State it as a documented assumption.)

Each book title has at most one publisher.

Physical copies of a title are tracked as a count (total_copies / available_copies) rather than as individually barcoded copy entities. This keeps the model to a manageable size.

Fines are calculated only for overdue loans, at a flat rate per day.

Reservations are placed against a title, not a specific copy.


## Deliverables
-  `Conceptual-data-model` — Conceptual Data Model (Created on Napkin.ai)
    
- `schema.sql` — DDL with keys and constraints
  
- `sample-data.sql` — test data
  
- `er-diagram.png` — ER diagram (generated from SQL Server Management Studio 22)
  
- `normalisation-notes.md` — 1NF to 3NF explanation

