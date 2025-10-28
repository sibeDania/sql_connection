library(DBI)
library(odbc)

readRenviron("~/Renviron")

con <- dbConnect(odbc(), Driver = "ODBC Driver 17 for SQL Server", 
                 Server = "xxxxx.database.windows.net", Database = "xxxx", 
                 Port = "xxxx", UID = Sys.getenv("usr"), PWD = Sys.getenv("pwd"))
####

dbExecute(con, "CREATE SCHEMA test;")


data <- data.frame(c("Hej" = "1"))


id <- Id(schema = "test",
         table = "data")

dbWriteTable(con, name = id, value = data, row.names = FALSE, overwrite = TRUE)

###

data2 <- dbGetQuery(con, "SELECT * FROM test.data")
