# Normalisation Explanation

## 1NF
All tables have atomic columns. No repeating groups. For example, books store one ISBN per row; members store one email per row. Reservations and loans are separate tables rather than repeating columns in members.

## 2NF
All non-key attributes fully depend on the primary key. In `books`, `title`, `author_id`, `publisher_id` depend on `book_id`. In `loans`, `due_date` depends on `loan_id`, not on a subset. No partial dependencies because we use surrogate primary keys.

## 3NF
No transitive dependencies. Publisher name/address are in `publishers`, not in `books`; author details are in `authors`. In `fines`, `amount` depends on `loan_id` only. The `loans` table stores `member_id` and `book_id` as foreign keys rather than duplicating member/book details.

## Result
Schema is in 3NF, reducing redundancy and update anomalies while preserving join paths for reporting.
