##appending all twitter CSV files together###

setwd("C:/Users/Nicole/Documents/Twitterdata")
path = "C:/Users/Nicole/Documents/Twitterdata"
dataTable <- ""
csv.files <- dir(path, pattern =".csv")

for(i in 1:length(csv.files)){
  subTable <- read.csv(csv.files[i],header=TRUE, sep=",", stringsAsFactors=FALSE)
  id <- csv.files[i]
  subTable$Hashtag <- rep(id, nrow(subTable))
  if(ncol(subTable) == 17){
    subTable$id.1 <- 0
    subTable <- subTable[, c(1,2,3,4,5,6,7,8,9,18,10,11,12,13,14,15,16,17)]
  }
  dataTable <- rbind(dataTable, subTable)
}

#check how many columns-- if there are 17 columns, add one column at subTable[10] 
#csv.files[177]

#--------------------------------------------------------------------------------------------------------------

fs <- list.files(path, pattern = glob2rx("*.csv"))
for (f in fs) {
  fname <- file.path(path, f)             ## current file name
  df <- read.csv(fname)                   ## read file
  df$id <- NULL                          ## delete column B
  myDB <- do.call("rbind", lapply(fs, function(x) {
    dat <- read.csv(x, header=TRUE)
    dat$fileName <- tools::file_path_sans_ext
    write.csv(df, fname, row.names = FALSE) ## write it out
  }))}

Lapply$Source <-tools::file_path_sans_ext
print(Lapply)

for(i in 1:length(csv.files)){
  dat <- read.csv("~*.csv", header=TRUE)
  dat$id <- NULL
}

myFiles <- list.files(path,pattern=".csv")
Lapply <- lapply(myFiles, read.csv, header=TRUE)

for(i in myFiles){
  myFiles$id <-NULL
}

for (f in myFiles) {
  fname <- file.path(path, f)             ## current file name
  df <- read.csv(fname)                   ## read file
  df$id <- NULL                           ## delete column B
  df
}



names(Lapply) <- myFiles

for(i in myFiles) {
  Lapply[[i]]$Source = i
do.call(rbind, Lapply)
}

print(Lapply)

####THIS Assigns the filename to a column in each dataframe
myDB <- do.call("rbind", lapply(myFiles, function(x) {
  dat <- read.csv(x, header=TRUE)
  dat$fileName <- tools::file_path_sans_ext(basename(x))
  dat
}))

View(file)
View(out.file)

write.table(out.file, file = "cand_Brazil.txt",sep=",", 
            row.names = FALSE, qmethod = "double",fileEncoding="windows-1252")
