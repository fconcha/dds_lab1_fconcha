# This is my first R program
print("Hello World!")

subject   <- "primer proyecto Felipe"
language  <- "R"
print(paste("Este es el primer proyecto de felipe",
            language,
            "for ",
            subject,
            "subject",
            sep = " "))

library(ggplot2)

if (!file.exists("db")) {
  exploitdb_url <- "https://github.com/offensive-security/exploit-database/raw/master/files_exploits.csv"
  #exploitdb_url <- "https://raw.githubusercontent.com/offensive-security/exploit-database/master/files.csv"
  download.file(exploitdb_url, destfile = "db")
}
db <- read.csv("./db", header = T)
db_aggr <- dplyr::count(db, platform, sort = T)
ggplot(db_aggr, aes(x = "", y = n, fill = platform)) + geom_bar(width = 1, stat = "identity")


db_aggr <- dplyr::count(db, platform, sort = T)
ggplot(head(db_aggr), aes(x=platform, y=n, fill=platform)) + geom_bar(stat = "identity")
