#!/usr/bin/env python3
import duckdb

con = duckdb.connect("dev.duckdb", read_only=True)
print(con.sql("select * from total_creditcard_riders_by_day"))
if (
    con.execute(
        "select * as total_rides from total_creditcard_riders_by_day"
    ).fetchall()[0][1]
    == 54743
):
    with open("/home/repl/workspace/successful_data_check", "w") as f:
        f.write("54743")
