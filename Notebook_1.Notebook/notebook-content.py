# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "4ecd799b-0967-4756-a550-39acb9ae87cd",
# META       "default_lakehouse_name": "test_lh",
# META       "default_lakehouse_workspace_id": "66b9bd45-2869-43fc-bca0-d183ff31203f",
# META       "known_lakehouses": [
# META         {
# META           "id": "4ecd799b-0967-4756-a550-39acb9ae87cd"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

df = spark.read.table("audit_log_table")

df.write \
    .mode("overwrite") \
    .option("header", "true") \
    .csv("Files/Exports/your_table_csv")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df = spark.read.table("CustLedgerEntry21")

df.coalesce(1).write \
    .mode("overwrite") \
    .option("header", "true") \
    .csv("Files/Exports/CustLedgerEntry21")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
