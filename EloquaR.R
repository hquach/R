# R Installation
# You can match the driver's performance gains from multithreading and managed code by running the multithreaded Microsoft R Open or by running open R linked with the BLAS/LAPACK libraries. This article uses Microsoft R Open 3.2.3, which is preconfigured to install packages from the Jan. 1, 2016 snapshot of the CRAN repository. This snapshot ensures reproducibility.


# Connect to Eloqua as a JDBC Data Source

driver <- JDBC(driverClass = "cdata.jdbc.eloqua.EloquaDriver", classPath = "MyInstallationDir\lib\cdata.jdbc.eloqua.jar", identifier.quote = "'")

conn <- dbConnect(driver,"jdbc:eloqua:User=user;Password=password;Company=CData;")


# Schema Discovery
# The driver models Eloqua APIs as relational tables, views, and stored procedures. Use the following line to retrieve the list of tables:

dbListTables(conn)

# Execute SQL Queries
# You can use the dbGetQuery function to execute any SQL query supported by the Eloqua API:
campaign <- dbGetQuery(conn,"SELECT Name, ActualCost FROM Campaign")

# You can view the results in a data viewer window with the following command:
View(campaign)

# Plot Eloqua Data Sample
par(las=2,ps=10,mar=c(5,15,4,2))
barplot(campaign$ActualCost, main="Eloqua Campaign", names.arg = campaign$Name, horiz=TRUE)