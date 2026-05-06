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

# MARKDOWN ********************

# ## Business Central merge data notebook
# In this part the files in the delta folder will be merge with the Lakehouse table.
# - It iterates first on the folders to append to the existing table.
# - After that is will remove all duplicates by sorting the table. 
# - At last it will remove all deleted records inside the table that are deleted in Business Central
# 
# Please change the parameters in the first part.

# CELL ********************

# MAGIC %%pyspark
# MAGIC #imports
# MAGIC import time
# MAGIC from pyspark.sql import SparkSession
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
# MAGIC workspace = '3bf70868-3692-4ebd-b453-b986cf3e838f' #can also be a GUID
# MAGIC Lakehouse = 'test_lh'; #can also be a GUID
# MAGIC #Remove_delta = True; #will remove the delta files if everything is processed
# MAGIC Drop_table_if_mismatch = True; #option to drop the table if json file has different columns then in the table
# MAGIC no_Partition = 258 #how many partition is used in the dataframe, a good starting point might be 2-4 partitions per CPU core in your Spark cluster
# MAGIC DecimalFormat = 'float' #how to format the decimal numbers, can be 'float' or 'decimal(10,3)'. If you change this it will be a breaking change for the table
# MAGIC DateTimeFormat = 'timestamp' #how to format the datetime, can be 'timestamp' or 'date'. If you change this it will be a breaking change for the table

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark",
# META   "frozen": false,
# META   "editable": true
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

# CELL ********************

# MAGIC %%pyspark
# MAGIC import json
# MAGIC import os
# MAGIC import glob
# MAGIC from pyspark.sql.types import *
# MAGIC from pyspark.sql.utils import AnalysisException
# MAGIC from pyspark.sql.functions import col
# MAGIC from pyspark.sql.functions import desc
# MAGIC file_list = []
# MAGIC 
# MAGIC for entry in os.scandir(folder_path):
# MAGIC  if entry.is_dir():
# MAGIC 
# MAGIC     for filename in glob.glob(folder_path + entry.name + '/*'):     
# MAGIC         table_name = entry.name.replace("-","")
# MAGIC         ContainsCompany = False
# MAGIC         df_new = spark.read.option("minPartitions", no_Partition).format("csv").option("header","true").load(folder_path_spark + entry.name +"/*")   
# MAGIC         file_list.append(filename) #collect the imported filed in a list for deletion later on
# MAGIC 
# MAGIC         f = open(folder_path_json + entry.name +".cdm.json")
# MAGIC         schema = json.load(f)
# MAGIC         # Parse the schema to get column names and data types
# MAGIC         column_names = [attr["name"] for attr in schema["definitions"][0]["hasAttributes"]] 
# MAGIC         if '$Company' in column_names:
# MAGIC             ContainsCompany = True
# MAGIC         column_types = [attr['dataFormat'] for attr in schema["definitions"][0]["hasAttributes"]]   
# MAGIC         for col_name, col_type in zip(column_names, column_types):
# MAGIC             if col_type == "String":
# MAGIC                 col_type = "string"
# MAGIC             if col_type == "Guid":
# MAGIC                 col_type = "string"
# MAGIC             if col_type == "Code":
# MAGIC                 col_type = "object"
# MAGIC             if col_type == "Option":
# MAGIC                 col_type = "string"
# MAGIC             if col_type == "Date":
# MAGIC                 col_type = "date"
# MAGIC             if col_type == "Time":
# MAGIC                 col_type = "string"
# MAGIC             if col_type == "DateTime":
# MAGIC                 col_type = DateTimeFormat
# MAGIC             if col_type == "Duration":
# MAGIC                 col_type = "timedelta"
# MAGIC             if col_type == "Decimal":
# MAGIC                 col_type = DecimalFormat
# MAGIC             if col_type == "Boolean":
# MAGIC                 col_type = "boolean"
# MAGIC             if col_type == "Integer":
# MAGIC                 col_type = "int"
# MAGIC             if col_type == "Int64":
# MAGIC                 col_type = "int"
# MAGIC             if col_type == "Int32":
# MAGIC                 col_type = "int"
# MAGIC             if col_name == 'SystemModifiedAt-2000000003': #Audit fields must be in timestamp
# MAGIC                 col_type = "timestamp"
# MAGIC             if col_name == 'SystemModifiedBy-2000000004': 
# MAGIC                 col_type = "timestamp"
# MAGIC 
# MAGIC             df_new = df_new.withColumn(col_name, df_new[col_name].cast(col_type))
# MAGIC 
# MAGIC         #check if the table exists
# MAGIC         if table_name in [t.name for t in spark.catalog.listTables()]:  
# MAGIC             #read the old data into a new dataframe and union with the new dataframe
# MAGIC             SQL_Query = "SELECT * FROM " + Lakehouse +"."+table_name;  
# MAGIC             #print(SQL_Query)
# MAGIC             df_old = spark.sql(SQL_Query)
# MAGIC             df_new = df_new.union(df_old).repartition(no_Partition)
# MAGIC 
# MAGIC             #delete all old records
# MAGIC             start = time.time()
# MAGIC             df_deletes = df_new.filter(df_new['SystemCreatedAt-2000000001'].isNull())
# MAGIC             print("delete filter By Time:", time.time() - start, "seconds")
# MAGIC 
# MAGIC             start = time.time()
# MAGIC             if ContainsCompany:
# MAGIC                 df_new = df_new.join(df_deletes, ['$Company','systemId-2000000000'], 'leftanti')
# MAGIC                 print("deleting By Time:", time.time() - start, "seconds")
# MAGIC             else:
# MAGIC                 df_new = df_new.join(df_deletes, ['systemId-2000000000'], 'leftanti')
# MAGIC             
# MAGIC             # remove duplicates by filtering on systemID and systemModifiedAt fields
# MAGIC             if ContainsCompany:
# MAGIC                 start = time.time()
# MAGIC                 df_new = df_new.orderBy('$Company','systemId-2000000000',desc('SystemModifiedAt-2000000003'))
# MAGIC                 print("Order By Time:", time.time() - start, "seconds")
# MAGIC                 start = time.time()
# MAGIC                 df_new = df_new.dropDuplicates(['$Company','systemId-2000000000'])
# MAGIC                 print("Drop duplicates By Time:", time.time() - start, "seconds")
# MAGIC 
# MAGIC             else:
# MAGIC                 df_new = df_new.orderBy('systemId-2000000000',desc('SystemModifiedAt-2000000003'))
# MAGIC                 df_new = df_new.dropDuplicates(['systemId-2000000000'])
# MAGIC             
# MAGIC             #overwrite the dataframe in the new table
# MAGIC             df_new.write.mode("overwrite").format("delta").save("Tables/" + table_name) 
# MAGIC         else:  
# MAGIC             #table isn't there so just insert it
# MAGIC             df_new.write.mode("overwrite").format("delta").save("Tables/" + table_name)
# MAGIC 
# MAGIC         #delete the files
# MAGIC         #if Remove_delta:
# MAGIC             #for filename in file_list:  
# MAGIC             #    try:  
# MAGIC             #        os.remove(filename)  
# MAGIC             #    except OSError as e:  # this would catch any error when trying to delete the file  
# MAGIC             #        print(f"Error: {filename} : {e.strerror}")
# MAGIC             #file_list = [] # clear the list */

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark",
# META   "frozen": false,
# META   "editable": true
# META }
