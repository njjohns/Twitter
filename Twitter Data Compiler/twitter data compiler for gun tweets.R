###Gun Project-Twitter data###
###Last updated: 1/28/2018###
#test

#set working director to Twitter data folder where all files are stored separately
dirOfInterest <- "C:/Users/Nicole/Documents/Twitterdata"
setwd(dirOfInterest)
path = dirOfInterest

#creates empty dataframe where all individual files will be appended together
dataTable <- ""

#csv.files is a vector of all the csv file paths from the Twitterdata folder
csv.files <- dir(path, pattern =".csv")

#Loop that reads in each csv file and appends to dataTable
for(i in 1:length(csv.files)){
  subTable <- read.csv(csv.files[i],header=TRUE, sep=",", stringsAsFactors=FALSE)
  id <- csv.files[i]
  #created new var Hashtag that contained file names as values
  subTable$Hashtag <- rep(id, nrow(subTable))   
  if(ncol(subTable) == 17){
    #some files did not have the variable id.1, so had to create a new var for these
    subTable$id.1 <- 0     
    subTable <- subTable[, c(1:9,18,10:17)]
  }
  dataTable <- rbind(dataTable, subTable)
}

##Removes blank row
dataTable <- dataTable[!apply(dataTable == "", 1, all),]

#Removes the file extension from the values in the variable Hashtag
dataTable$Hashtag <- gsub(".csv", "", dataTable$Hashtag)

#check how many columns-- if there are 17 columns, add one column at subTable[10] 
#csv.files[177]

dataTable$Sentiment <- ifelse(grepl("banassault", dataTable$Hashtag, ignore.case = T), "Gun control", 
                  ifelse(grepl("twoa", dataTable$Hashtag, ignore.case = T), "Pro gun", 
                  ifelse(grepl("guncontrol", dataTable$Hashtag, ignore.case=T), "Gun control", 
                  ifelse(grepl("guncontrolnever", dataTable$Hashtag, ignore.case=T), "Pro gun", 
                  ifelse(grepl("guncontrolnow", dataTable$Hashtag, ignore.case=T), "Gun control",
                  ifelse(grepl("gunviolence", dataTable$Hashtag, ignore.case=T), "Gun control", 
                  ifelse(grepl("endgunviolence", dataTable$Hashtag, ignore.case=T), "Gun control",   
                  ifelse(grepl("noguncontrol", dataTable$Hashtag, ignore.case=T), "Pro gun", 
                  ifelse(grepl("secondamendment", dataTable$Hashtag, ignore.case=T), "Pro gun", 
                  ifelse(grepl("righttobeararm", dataTable$Hashtag, ignore.case=T), "Pro gun", 
                  ifelse(grepl("gunrights", dataTable$Hashtag, ignore.case=T), "Pro gun", 
                  ifelse(grepl("twoadefenders", dataTable$Hashtag, ignore.case=T), "Pro gun", "Ambiguous")))))))))))) 
                    
                    


if(FALSE){

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



}