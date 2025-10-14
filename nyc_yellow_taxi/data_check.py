#!/usr/bin/env python3
import duckdb

con = duckdb.connect("dev.duckdb", read_only=True)
print(con.sql("select * from taxi_rides_raw limit 10"))
print(con.sql("select count(*) as total_rides from taxi_rides_raw"))
if (
    con.execute("select count(*) as total_rides from taxi_rides_raw").fetchall()[0][0]
    == 300000
):
    with open("/home/repl/workspace/successful_data_check", "w") as f:
        f.write("300000")
