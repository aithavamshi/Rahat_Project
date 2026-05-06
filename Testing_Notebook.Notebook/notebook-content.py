# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "63e68eb3-92cb-42a3-96c8-c103ffcebcc7",
# META       "default_lakehouse_name": "test",
# META       "default_lakehouse_workspace_id": "f6a7e8bf-6fb8-46fb-bc50-09b1cb575eb7",
# META       "known_lakehouses": [
# META         {
# META           "id": "63e68eb3-92cb-42a3-96c8-c103ffcebcc7"
# META         }
# META       ]
# META     }
# META   }
# META }

# MARKDOWN ********************

# **Table_Copy_Code**

# CELL ********************

# Fix for old date issue
spark.conf.set("spark.sql.parquet.datetimeRebaseModeInRead", "LEGACY")
spark.conf.set("spark.sql.parquet.datetimeRebaseModeInWrite", "LEGACY")

df = spark.read.table("Rahat_LH.dbo.item")

df.write.format("delta") \
  .mode("overwrite") \
  .option("overwriteSchema", "true") \
  .saveAsTable("test.dbo.item")

print("Table Copied>>")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# MARKDOWN ********************

# **Folder_Copy_Code**

# CELL ********************

from notebookutils import mssparkutils

# Define your source and destination paths
source_path = "abfss://Rahat_dev_vamshi@onelake.dfs.fabric.microsoft.com/Rahat_LH.Lakehouse/Files/BinContent-7302.cdm.json"
dest_path = "abfss://Rahat_dev_vamshi@onelake.dfs.fabric.microsoft.com/test.Lakehouse/Files"

# Copy the entire folder
mssparkutils.fs.cp(source_path, dest_path, True)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

from notebookutils import mssparkutils

# Define your source and destination paths
source_path = "abfss://Rahat_dev_vamshi@onelake.dfs.fabric.microsoft.com/Rahat_LH.Lakehouse/Files"
dest_path = "abfss://Rahat_dev_vamshi@onelake.dfs.fabric.microsoft.com/test.Lakehouse/Files"

# Copy the entire folder
mssparkutils.fs.cp(source_path, dest_path, True)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# MARKDOWN ********************

# **_Code_Running_Time_Identifying_Code**

# CELL ********************

import time
from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()

# STEP 1: Create dummy data
start = time.time()

data = [(i, i*10) for i in range(1000000)]
df = spark.createDataFrame(data, ["id", "value"])

print("Step 1 (Create Data) Time:", time.time() - start, "seconds")


# STEP 2: Transformation
start = time.time()

df_filtered = df.filter("value > 5000")

print("Step 2 (Filter) Time:", time.time() - start, "seconds")


# STEP 3: Aggregation
start = time.time()

df_grouped = df_filtered.groupBy().sum("value")

print("Step 3 (Aggregation) Time:", time.time() - start, "seconds")


# STEP 4: Action (VERY IMPORTANT)
start = time.time()

df_grouped.show()

print("Step 4 (Action - Show) Time:", time.time() - start, "seconds")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# MARKDOWN ********************

# ****Aduit log table code****

# CELL ********************

log_schema = StructType([
    StructField("TableName", StringType(), True),
    StructField("StartTime", TimestampType(), True),
    StructField("EndTime", TimestampType(), True),
    StructField("Status", StringType(), True),
    StructField("RecordsRead", IntegerType(), True),
    StructField("RecordsWritten", IntegerType(), True),
    StructField("FilesProcessed", IntegerType(), True),
    StructField("ErrorMessage", StringType(), True)
])


from datetime import datetime

# Create Empty Log List (Place BEFORE loop)
log_data = []

for entry in os.scandir(folder_path):

    start_time = datetime.now()
    error_message = ""
    status = "Started"
    records_read = 0
    records_written = 0
    files_processed = 0

    try:
        # Count files processed
        files_processed = len(folder_files)

        # After Reading CSV
        records_read = df_new.count()

        # Your Existing Processing Logic Here
        # (merge, dedupe, write etc...)

        # After Writing Table
        records_written = df_new.count()
        status = "Success"
        end_time = datetime.now()

    except Exception as e:
        status = "Failed"
        error_message = str(e)
        end_time = datetime.now()

    # Append Log
    log_data.append((
        table_name,
        start_time,
        end_time,
        status,
        records_read,
        records_written,
        files_processed,
        error_message
    ))


# Create Log DataFrame (After Loop Ends)
log_df = spark.createDataFrame(log_data, log_schema)

# Save Log Table
log_df.write.mode("append").format("delta").saveAsTable("Log_Entries") 
#save("Tables/Log_Entries")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
