# Portfolio 2: Query Processing and Optimisation

## Queries
`queries.sql` contains 5 analytical queries.
`indexes.sql` creates indexes.
`explain-before.sql` and `explain-after.sql` show execution plans.

## How to Run
```bash
mysql -u root -p city_library < queries.sql
mysql -u root -p city_library < explain-before.sql
mysql -u root -p city_library < indexes.sql
mysql -u root -p city_library < explain-after.sql
