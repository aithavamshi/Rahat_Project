# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "5be1a843-3a24-405d-893e-d44dc466e5a2",
# META       "default_lakehouse_name": "Rahat_LH",
# META       "default_lakehouse_workspace_id": "f6a7e8bf-6fb8-46fb-bc50-09b1cb575eb7",
# META       "known_lakehouses": [
# META         {
# META           "id": "5be1a843-3a24-405d-893e-d44dc466e5a2"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# MAGIC %%pyspark
# MAGIC 
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
# MAGIC workspace = '3bf70868-3692-4ebd-b453-b986cf3e838f' #can also be a GUID
# MAGIC Lakehouse = 'Bronze_2'; #can also be a GUID
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

# Safer, faster shuffles
spark.conf.set("spark.sql.adaptive.enabled", "true")
spark.conf.set("spark.sql.adaptive.coalescePartitions.enabled", "true")
spark.conf.set("spark.sql.adaptive.skewJoin.enabled", "true")

# Keep shuffle parallelism in sync with your target partitioning
spark.conf.set("spark.sql.shuffle.partitions", no_Partition)

# Larger input splits + cheaper file open cost → fewer tiny tasks
spark.conf.set("spark.sql.files.maxPartitionBytes", 536870912)   # 512MB
spark.conf.set("spark.sql.files.openCostInBytes", 134217728)

# Make file discovery and scanning more robust
spark.conf.set("spark.sql.files.ignoreMissingFiles", "true")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# MAGIC %%pyspark
# MAGIC import os
# MAGIC import json
# MAGIC from pyspark.sql.types import *
# MAGIC if Drop_table_if_mismatch:
# MAGIC     existing = {t.name for t in spark.catalog.listTables(Lakehouse)}
# MAGIC 
# MAGIC     for filename in os.listdir(folder_path_json):
# MAGIC         if "manifest" in filename or not filename.endswith(".cdm.json"):
# MAGIC             continue
# MAGIC 
# MAGIC         raw = filename[:-9]  # strip ".cdm.json"
# MAGIC         table_name = raw.replace("-", "")
# MAGIC 
# MAGIC         if table_name not in existing:
# MAGIC             continue
# MAGIC 
# MAGIC         # -- get schema length without scanning data
# MAGIC         num_cols_table = len(spark.catalog.listColumns(f"{Lakehouse}.{table_name}"))
# MAGIC 
# MAGIC         with open(os.path.join(folder_path_json, filename)) as f:
# MAGIC             schema = json.load(f)
# MAGIC         num_names = len(schema["definitions"][0]["hasAttributes"])
# MAGIC 
# MAGIC         if num_cols_table != num_names:
# MAGIC             spark.sql(f"DROP TABLE IF EXISTS {Lakehouse}.{table_name}")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# MAGIC %%pyspark
# MAGIC import os
# MAGIC import glob
# MAGIC from pyspark.sql.types import *
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

# CELL ********************

# MAGIC %%pyspark
# MAGIC import json
# MAGIC import os
# MAGIC import glob
# MAGIC from pyspark.sql.types import *
# MAGIC from pyspark.sql.utils import AnalysisException
# MAGIC from pyspark.sql.functions import col, desc
# MAGIC from pyspark import StorageLevel
# MAGIC 
# MAGIC for entry in os.scandir(folder_path):
# MAGIC     if not entry.is_dir():
# MAGIC         continue
# MAGIC 
# MAGIC     # Collect files (not subfolders) in this table’s folder
# MAGIC     folder_glob = os.path.join(folder_path, entry.name, '*')
# MAGIC     folder_files = [p for p in glob.glob(folder_glob) if os.path.isfile(p)]
# MAGIC 
# MAGIC     # Skip if no CSVs present (matches your old loop’s behavior)
# MAGIC     if not folder_files:
# MAGIC         print(f"Skipping {entry.name}: no files found.")
# MAGIC         continue
# MAGIC 
# MAGIC     table_name = entry.name.replace("-", "")
# MAGIC     ContainsCompany = False
# MAGIC 
# MAGIC     # Read ALL CSVs in this table’s folder ONCE (process increment together)
# MAGIC     try:
# MAGIC         df_new = (
# MAGIC             spark.read
# MAGIC                  .option("recursiveFileLookup", "true")
# MAGIC                  .option("minPartitions", no_Partition)
# MAGIC                  .format("csv")
# MAGIC                  .option("header", "true")
# MAGIC                  .load(folder_path_spark + entry.name + "/*")
# MAGIC         )
# MAGIC     except AnalysisException as e:
# MAGIC         if "PATH_NOT_FOUND" in str(e):
# MAGIC             print(f"Skipping {entry.name}: source path not found at read time.")
# MAGIC             continue
# MAGIC         else:
# MAGIC             raise
# MAGIC 
# MAGIC     # Load schema and cast (unchanged logic)
# MAGIC     with open(folder_path_json + entry.name + ".cdm.json") as f:
# MAGIC         schema = json.load(f)
# MAGIC 
# MAGIC     column_names = [attr["name"] for attr in schema["definitions"][0]["hasAttributes"]]
# MAGIC     if '$Company' in column_names:
# MAGIC         ContainsCompany = True
# MAGIC     column_types = [attr['dataFormat'] for attr in schema["definitions"][0]["hasAttributes"]]
# MAGIC 
# MAGIC     for col_name, col_type in zip(column_names, column_types):
# MAGIC         if col_type == "String":
# MAGIC             col_type = "string"
# MAGIC         if col_type == "Guid":
# MAGIC             col_type = "string"
# MAGIC         if col_type == "Code":
# MAGIC             col_type = "object"
# MAGIC         if col_type == "Option":
# MAGIC             col_type = "string"
# MAGIC         if col_type == "Date":
# MAGIC             col_type = "date"
# MAGIC         if col_type == "Time":
# MAGIC             col_type = "string"
# MAGIC         if col_type == "DateTime":
# MAGIC             col_type = DateTimeFormat
# MAGIC         if col_type == "Duration":
# MAGIC             col_type = "timedelta"
# MAGIC         if col_type == "Decimal":
# MAGIC             col_type = DecimalFormat
# MAGIC         if col_type == "Boolean":
# MAGIC             col_type = "boolean"
# MAGIC         if col_type == "Integer":
# MAGIC             col_type = "int"
# MAGIC         if col_type == "Int64":
# MAGIC             col_type = "int"
# MAGIC         if col_type == "Int32":
# MAGIC             col_type = "int"
# MAGIC         if col_name == 'SystemModifiedAt-2000000003':
# MAGIC             col_type = "timestamp"
# MAGIC         if col_name == 'SystemModifiedBy-2000000004':
# MAGIC             col_type = "timestamp"
# MAGIC 
# MAGIC         df_new = df_new.withColumn(col_name, df_new[col_name].cast(col_type))
# MAGIC 
# MAGIC     # Merge with existing table (unchanged behavior)
# MAGIC     if table_name in [t.name for t in spark.catalog.listTables()]:
# MAGIC         SQL_Query = "SELECT * FROM " + Lakehouse + "." + table_name
# MAGIC         df_old = spark.sql(SQL_Query)
# MAGIC 
# MAGIC     # New (no logic change, just execution plan):
# MAGIC         df_union = df_new.union(df_old).persist(StorageLevel.MEMORY_AND_DISK)
# MAGIC 
# MAGIC         df_deletes = df_union.filter(df_union['SystemCreatedAt-2000000001'].isNull())
# MAGIC         if ContainsCompany:
# MAGIC             df_new = df_union.join(df_deletes, ['$Company','systemId-2000000000'], 'leftanti')
# MAGIC         else:
# MAGIC             df_new = df_union.join(df_deletes, ['systemId-2000000000'], 'leftanti')
# MAGIC 
# MAGIC         df_union.unpersist()
# MAGIC 
# MAGIC         # Dedupe (unchanged)
# MAGIC         if ContainsCompany:
# MAGIC             df_new = df_new.orderBy('$Company','systemId-2000000000',desc('SystemModifiedAt-2000000003')) \
# MAGIC                         .dropDuplicates(['$Company','systemId-2000000000'])
# MAGIC         else:
# MAGIC             df_new = df_new.orderBy('systemId-2000000000',desc('SystemModifiedAt-2000000003')) \
# MAGIC                         .dropDuplicates(['systemId-2000000000'])
# MAGIC 
# MAGIC         # Repartition ONCE, after dedupe, to keep your target layout
# MAGIC         df_new = df_new.repartition(no_Partition)
# MAGIC 
# MAGIC         df_new.write.mode("overwrite").format("delta").save("Tables/" + table_name)
# MAGIC 
# MAGIC 
# MAGIC     # After successful write, delete all CSVs we just processed (once per folder)
# MAGIC     if Remove_delta:
# MAGIC         for filename in folder_files:
# MAGIC             try:
# MAGIC                 os.remove(filename)
# MAGIC             except OSError as e:
# MAGIC                 print(f"Error: {filename} : {e.strerror}")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
