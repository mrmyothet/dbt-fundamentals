import duckdb
import sys
import os

# p = "/workspaces/dbt-fundamentals/jaffle_shop_practice/data/raw_jaffle_shop.duckdb"
path = 'data/raw_jaffle_shop.duckdb'
print("exists:", os.path.exists(path))

con = duckdb.connect(path)
try:
    print(con.execute("SELECT count(*) FROM main.raw_customers").fetchall())
except Exception as e:
    print("error:", e)
con.close()
