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

# MARKDOWN ********************

# ## Business Central merge data notebook
# In this part the files in the delta folder will be merge with the Lakehouse table.
# - It iterates first on the folders to append to the existing table.
# - After that is will remove all duplicates by sorting the table. 
# - At last it will remove all deleted records inside the table that are deleted in Business Central
# 
# Please change the parameters in the first part.

# PARAMETERS CELL ********************

run_id = 'abc'

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# MAGIC %%pyspark
# MAGIC #imports
# MAGIC import time
# MAGIC from pyspark.sql import SparkSession
# MAGIC from notebookutils import mssparkutils
# MAGIC spark = SparkSession.builder.getOrCreate()
# MAGIC # settings
# MAGIC spark.conf.set("sprk.sql.parquet.vorder.enabled","true")
# MAGIC spark.conf.set("spark.microsoft.delta.optimizewrite.enabled","true")
# MAGIC spark.conf.set("spark.sql.parquet.filterPushdown", "true")
# MAGIC spark.conf.set("spark.sql.parquet.mergeSchema", "false")
# MAGIC spark.conf.set("spark.hadoop.mapreduce.fileoutputcommitter.algorithm.version", "2")
# MAGIC spark.conf.set("spark.sql.delta.commitProtocol.enabled", "true")
# MAGIC spark.conf.set("spark.sql.analyzer.maxIterations", 500)
# MAGIC 
# MAGIC # file paths
# MAGIC folder_path_spark = 'Files/deltas/' # this is mostly the default
# MAGIC folder_path_json = '/lakehouse/default/Files/' # this is mostly the default
# MAGIC folder_path_reset = '/lakehouse/default/Files/reset/' # this is mostly the default
# MAGIC folder_path = '/lakehouse/default/Files/deltas/' # this is mostly the default
# MAGIC 
# MAGIC # parameters
# MAGIC workspace = '66b9bd45-2869-43fc-bca0-d183ff31203f' #can also be a GUID
# MAGIC Lakehouse = 'test_lh'; #can also be a GUID
# MAGIC Remove_delta = True; #will remove the delta files if everything is processed
# MAGIC Drop_table_if_mismatch = True; #option to drop the table if json file has different columns then in the table
# MAGIC no_Partition = 258 #how many partition is used in the dataframe, a good starting point might be 2-4 partitions per CPU core in your Spark cluster
# MAGIC DecimalFormat = 'float' #how to format the decimal numbers, can be 'float' or 'decimal(10,3)'. If you change this it will be a breaking change for the table
# MAGIC DateTimeFormat = 'timestamp' #how to format the datetime, can be 'timestamp' or 'date'. If you change this it will be a breaking change for the table


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# MAGIC %%pyspark
# MAGIC import os # Used to read files from folder
# MAGIC import json
# MAGIC from pyspark.sql.types import * # Used for defining data types (not used much here directly)
# MAGIC 
# MAGIC if Drop_table_if_mismatch:
# MAGIC 
# MAGIC     def count_keys(obj):  
# MAGIC         if isinstance(obj, dict):  
# MAGIC             return len(obj) + sum(count_keys(v) for v in obj.values())  
# MAGIC         if isinstance(obj, list):  
# MAGIC             return sum(count_keys(v) for v in obj)  
# MAGIC         return 0  
# MAGIC     
# MAGIC     for filename in os.listdir(folder_path_json):
# MAGIC         if "manifest" not in filename: # exclude the manifest files
# MAGIC             if filename.endswith(".cdm.json"):
# MAGIC                 table_name = filename.replace("-","")
# MAGIC                 table_name = table_name.replace(".cdm.json","")
# MAGIC 
# MAGIC                 if table_name in [t.name for t in spark.catalog.listTables()]:
# MAGIC                     #count number of columns in existing table
# MAGIC                     SQL_Query = "SELECT * FROM " + Lakehouse +"."+table_name;  
# MAGIC                     df = spark.sql(SQL_Query)
# MAGIC                     num_cols_table = len(df.columns)                
# MAGIC 
# MAGIC                     #count number of columns in json file                
# MAGIC                     f = open(folder_path_json + filename)
# MAGIC                     schema = json.load(f)
# MAGIC                     has_attributes = schema["definitions"][0]["hasAttributes"]  
# MAGIC                     num_names = len(has_attributes)
# MAGIC 
# MAGIC                     if num_cols_table != num_names:
# MAGIC                         df = spark.sql("DROP TABLE IF EXISTS "+ Lakehouse + "." + table_name)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# MAGIC %%pyspark
# MAGIC import os
# MAGIC import glob # Used to search files using patterns (not heavily used here)
# MAGIC from pyspark.sql.types import * # For data types (not used directly here)
# MAGIC 
# MAGIC if os.path.exists(folder_path_reset):
# MAGIC     for filename in os.listdir(folder_path_reset):
# MAGIC         # Remove the table
# MAGIC         table_name = filename.replace("-","")
# MAGIC         table_name = table_name.replace(".txt","")
# MAGIC 
# MAGIC         df = spark.sql("DROP TABLE IF EXISTS "+ Lakehouse + "." + table_name)
# MAGIC 
# MAGIC         try:  
# MAGIC             os.remove(folder_path_reset + '/' + filename)  
# MAGIC         except OSError as e:  # this would catch any error when trying to delete the file  
# MAGIC             print(f"Error: {filename} : {e.strerror}")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# MARKDOWN ********************

# **Audit Table Working Code**

# CELL ********************

# MAGIC %%pyspark
# MAGIC import json
# MAGIC import os
# MAGIC import glob
# MAGIC import time
# MAGIC from datetime import datetime
# MAGIC from pyspark.sql.types import *
# MAGIC from pyspark.sql.utils import AnalysisException
# MAGIC from pyspark.sql.functions import col, desc, row_number, lit, current_timestamp
# MAGIC from pyspark.sql.window import Window
# MAGIC from delta.tables import DeltaTable
# MAGIC 
# MAGIC 
# MAGIC def write_audit_log(
# MAGIC 
# MAGIC     run_id,
# MAGIC     table_name,
# MAGIC     start_time,
# MAGIC     end_time,
# MAGIC     status,
# MAGIC     rows_inserted,
# MAGIC     rows_updated,
# MAGIC     rows_deleted,
# MAGIC     files_processed,
# MAGIC     error_message=""
# MAGIC ):
# MAGIC     audit_data = [(
# MAGIC 
# MAGIC         run_id,
# MAGIC         table_name,
# MAGIC         start_time,
# MAGIC         end_time,
# MAGIC         status,
# MAGIC         rows_inserted,
# MAGIC         rows_updated,
# MAGIC         rows_deleted,
# MAGIC         files_processed,
# MAGIC         error_message
# MAGIC     )]
# MAGIC 
# MAGIC     audit_schema = StructType([
# MAGIC         StructField("Run_ID",      StringType(),    True),
# MAGIC         StructField("TableName",      StringType(),    True),
# MAGIC         StructField("StartTime",      TimestampType(), True),
# MAGIC         StructField("EndTime",        TimestampType(), True),
# MAGIC         StructField("Status",         StringType(),    True),
# MAGIC         StructField("RowsInserted",   LongType(),      True),
# MAGIC         StructField("RowsUpdated",    LongType(),      True),
# MAGIC         StructField("RowsDeleted",    LongType(),      True),
# MAGIC         StructField("FilesProcessed", LongType(),      True),
# MAGIC         StructField("ErrorMessage",   StringType(),    True),
# MAGIC     ])
# MAGIC 
# MAGIC     audit_df = spark.createDataFrame(audit_data, schema=audit_schema)
# MAGIC 
# MAGIC     # Append to audit table — creates it on first run automatically
# MAGIC     audit_df.write \
# MAGIC         .mode("append") \
# MAGIC         .format("delta") \
# MAGIC         .option("mergeSchema", "true")\
# MAGIC         .save("Tables/audit_log_table_testing")
# MAGIC 
# MAGIC     #print(f"Audit log written for: {table_name} | Status: {status}")
# MAGIC 
# MAGIC 
# MAGIC 
# MAGIC # MAIN PROCESSING LOOP
# MAGIC 
# MAGIC file_list = []
# MAGIC 
# MAGIC 
# MAGIC for entry in os.scandir(folder_path):
# MAGIC     if entry.is_dir():
# MAGIC 
# MAGIC         # Collect all files for this folder
# MAGIC         folder_files = glob.glob(folder_path + entry.name + '/*')
# MAGIC 
# MAGIC         for filename in folder_files:
# MAGIC             table_name       = entry.name.replace("-", "")
# MAGIC             ContainsCompany  = False
# MAGIC             inserted         = 0
# MAGIC             updated          = 0
# MAGIC             deleted          = 0
# MAGIC             error_message    = ""
# MAGIC             status           = "Success"
# MAGIC             files_processed  = len(folder_files)
# MAGIC 
# MAGIC             # Record start time for this table
# MAGIC             table_start_time = datetime.now()
# MAGIC 
# MAGIC             try:
# MAGIC                 
# MAGIC                 # READ CSV
# MAGIC                 
# MAGIC                 df_new = spark.read \
# MAGIC                     .option("minPartitions", no_Partition) \
# MAGIC                     .format("csv") \
# MAGIC                     .option("header", "true") \
# MAGIC                     .load(folder_path_spark + entry.name + "/*")
# MAGIC 
# MAGIC                 file_list.append(filename)
# MAGIC 
# MAGIC          
# MAGIC                 # READ JSON SCHEMA
# MAGIC               
# MAGIC                 #print("Getting column names from json")
# MAGIC                 f = open(folder_path_json + entry.name + ".cdm.json")
# MAGIC                 schema = json.load(f)
# MAGIC 
# MAGIC                 column_names = [attr["name"]       for attr in schema["definitions"][0]["hasAttributes"]]
# MAGIC                 column_types = [attr["dataFormat"]  for attr in schema["definitions"][0]["hasAttributes"]]
# MAGIC 
# MAGIC                 if '$Company' in column_names:
# MAGIC                     ContainsCompany = True
# MAGIC 
# MAGIC              
# MAGIC                 # CAST COLUMNS
# MAGIC               
# MAGIC                 for col_name, col_type in zip(column_names, column_types):
# MAGIC                     if col_type == "String":    col_type = "string"
# MAGIC                     if col_type == "Guid":      col_type = "string"
# MAGIC                     if col_type == "Code":      col_type = "string"
# MAGIC                     if col_type == "Option":    col_type = "string"
# MAGIC                     if col_type == "Date":      col_type = "date"
# MAGIC                     if col_type == "Time":      col_type = "string"
# MAGIC                     if col_type == "DateTime":  col_type = DateTimeFormat
# MAGIC                     if col_type == "Duration":  col_type = "timedelta"
# MAGIC                     if col_type == "Decimal":   col_type = DecimalFormat
# MAGIC                     if col_type == "Boolean":   col_type = "boolean"
# MAGIC                     if col_type == "Integer":   col_type = "int"
# MAGIC                     if col_type == "Int64":     col_type = "int"
# MAGIC                     if col_type == "Int32":     col_type = "int"
# MAGIC                     if col_name == 'SystemModifiedAt-2000000003':
# MAGIC                         col_type = "timestamp"
# MAGIC                     if col_name == 'SystemModifiedBy-2000000004':
# MAGIC                         col_type = "timestamp"
# MAGIC 
# MAGIC                     df_new = df_new.withColumn(col_name, df_new[col_name].cast(col_type))
# MAGIC 
# MAGIC            
# MAGIC                 # CHECK IF TABLE EXISTS
# MAGIC             
# MAGIC                 #print("Processing table:", table_name)
# MAGIC                 existing_tables = [t.name for t in spark.catalog.listTables()]
# MAGIC 
# MAGIC                 if table_name in existing_tables:
# MAGIC 
# MAGIC 
# MAGIC                     delta_table  = DeltaTable.forName(spark, table_name)
# MAGIC 
# MAGIC                     df_old = delta_table.toDF()
# MAGIC 
# MAGIC                     inserted = df_new.alias("new").join(
# MAGIC                         df_old.alias("old"),
# MAGIC                         on="systemId-2000000000",
# MAGIC                         how="leftanti"
# MAGIC                     ).count()
# MAGIC 
# MAGIC                     # Get old table as DataFrame
# MAGIC                     
# MAGIC                     #df_old = spark.table(table_name)
# MAGIC 
# MAGIC                     # Identify updated rows
# MAGIC                     df_updates = df_new.alias("new").join(
# MAGIC                         df_old.alias("old"),
# MAGIC                         col("new.`systemId-2000000000`") == col("old.`systemId-2000000000`")
# MAGIC                     ).filter(
# MAGIC                         col("new.`SystemModifiedAt-2000000003`") > col("old.`SystemModifiedAt-2000000003`")
# MAGIC                     )
# MAGIC 
# MAGIC                 
# MAGIC                     # HANDLE DELETES
# MAGIC                   
# MAGIC                     df_deletes = df_new.filter(col("SystemCreatedAt-2000000001").isNull())
# MAGIC 
# MAGIC                     deleted = df_deletes.count()
# MAGIC 
# MAGIC                     if df_deletes.count() > 0:
# MAGIC                         print("Deleting records from target...")
# MAGIC                         delta_table = DeltaTable.forName(spark, table_name)
# MAGIC                         delta_table.alias("old").merge(
# MAGIC                             df_deletes.alias("del"),
# MAGIC                             "old.`systemId-2000000000` = del.`systemId-2000000000`"
# MAGIC                         ).whenMatchedDelete().execute()
# MAGIC 
# MAGIC                   
# MAGIC                     # FILTER INVALID RECORDS
# MAGIC                    
# MAGIC                     df_new = df_new.filter(col("SystemCreatedAt-2000000001").isNotNull())
# MAGIC 
# MAGIC                  
# MAGIC                     # DROP DUPLICATES
# MAGIC                   
# MAGIC                     if ContainsCompany:
# MAGIC                         window_spec = Window.partitionBy("systemId-2000000000") \
# MAGIC                                            .orderBy(desc("SystemModifiedAt-2000000003"))
# MAGIC                     else:
# MAGIC                         window_spec = Window.partitionBy("systemId-2000000000") \
# MAGIC                                            .orderBy(desc("SystemModifiedAt-2000000003"))
# MAGIC 
# MAGIC                     df_new = df_new.withColumn("rn", row_number().over(window_spec)) \
# MAGIC                                    .filter(col("rn") == 1) \
# MAGIC                                    .drop("rn")
# MAGIC                     
# MAGIC                     
# MAGIC 
# MAGIC                     # Count updates
# MAGIC                     updated = df_updates.count()
# MAGIC 
# MAGIC                    
# MAGIC                     # MERGE
# MAGIC                    
# MAGIC                     
# MAGIC                     merge_start  = time.time()
# MAGIC 
# MAGIC                     merge_result = delta_table.alias("old").merge(
# MAGIC                         df_new.alias("new"),
# MAGIC                         "old.`systemId-2000000000` = new.`systemId-2000000000`"
# MAGIC                     ).whenMatchedUpdateAll() \
# MAGIC                      .whenNotMatchedInsertAll() \
# MAGIC                      .execute()
# MAGIC 
# MAGIC                     #print("Merge time:", time.time() - merge_start)
# MAGIC 
# MAGIC                 else:
# MAGIC                   
# MAGIC                     # NEW TABLE — WRITE DIRECTLY
# MAGIC                  
# MAGIC                     print("New table - writing directly")
# MAGIC                     write_start = time.time()
# MAGIC 
# MAGIC                     df_new.write \
# MAGIC                         .mode("overwrite") \
# MAGIC                         .format("delta") \
# MAGIC                         .save("Tables/" + table_name)
# MAGIC 
# MAGIC                     #print("Write time:", time.time() - write_start)
# MAGIC 
# MAGIC                     # For new table all rows are inserts
# MAGIC                     inserted = df_new.count()
# MAGIC                     updated  = 0
# MAGIC                     deleted  = 0
# MAGIC 
# MAGIC                 status = "Success"
# MAGIC 
# MAGIC             except Exception as e:
# MAGIC                 # Capture any error that happened during processing
# MAGIC                 status        = "Failed"
# MAGIC                 error_message = str(e)
# MAGIC                 print(f"ERROR processing {table_name}: {error_message}")
# MAGIC 
# MAGIC             finally:
# MAGIC                
# MAGIC                 # WRITE AUDIT LOG — runs whether success or failure
# MAGIC              
# MAGIC                 table_end_time = datetime.now()
# MAGIC 
# MAGIC                 write_audit_log(
# MAGIC                     run_id         = run_id,
# MAGIC                     table_name     = table_name,
# MAGIC                     start_time     = table_start_time,
# MAGIC                     end_time       = table_end_time,
# MAGIC                     status         = status,
# MAGIC                     rows_inserted  = inserted,
# MAGIC                     rows_updated   = updated,
# MAGIC                     rows_deleted   = deleted,
# MAGIC                     files_processed= files_processed,
# MAGIC                     error_message  = error_message
# MAGIC                 )
# MAGIC 
# MAGIC             #break  # process each folder once, not per file
# MAGIC 
# MAGIC 
# MAGIC             #delete the files
# MAGIC         if Remove_delta:
# MAGIC             for filename in file_list:  
# MAGIC                 try:  
# MAGIC                     os.remove(filename)  
# MAGIC                 except OSError as e:  # this would catch any error when trying to delete the file  
# MAGIC                     print(f"Error: {filename} : {e.strerror}")
# MAGIC             file_list = [] # clear the list */


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark",
# META   "frozen": false,
# META   "editable": true
# META }

# CELL ********************

from notebookutils import mssparkutils

files = mssparkutils.fs.ls("Files")
for f in files:
    print(f.name)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark",
# META   "frozen": true,
# META   "editable": false
# META }

# MARKDOWN ********************

# timestamp code

# CELL ********************

from datetime import datetime, timezone

current_timestamp = datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%S.%f')[:-3] + 'Z'

print(current_timestamp)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark",
# META   "frozen": false,
# META   "editable": true
# META }
