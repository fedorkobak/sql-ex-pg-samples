# sql-ex.ru PG

Set up [sql-ex.ru](https://sql-ex.ru) sample data in PostgreSQL. You can run queries in the local environment you like.

Run with:

```bash
docker compose up -d
```

For example, access through psql:

```bash
$ export PGPASSWORD=sql_ex
$ psql -U sql_ex -h localhost

psql (16.13 (Ubuntu 16.13-0ubuntu0.24.04.1))
Type "help" for help.

sql_ex=# \dt
           List of relations
 Schema |     Name     | Type  | Owner  
--------+--------------+-------+--------
 public | battles      | table | sql_ex
 public | classes      | table | sql_ex
 public | company      | table | sql_ex
 public | games        | table | sql_ex
 public | income       | table | sql_ex
 public | income_o     | table | sql_ex
 public | laptop       | table | sql_ex
 public | lineups      | table | sql_ex
 public | outcome      | table | sql_ex
 public | outcome_o    | table | sql_ex
 public | outcomes     | table | sql_ex
 public | pass_in_trip | table | sql_ex
 public | passenger    | table | sql_ex
 public | pc           | table | sql_ex
 public | players      | table | sql_ex
 public | printer      | table | sql_ex
 public | product      | table | sql_ex
 public | ships        | table | sql_ex
 public | trip         | table | sql_ex
 public | utb          | table | sql_ex
 public | utq          | table | sql_ex
 public | utv          | table | sql_ex
(22 rows)
```
