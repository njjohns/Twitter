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

#Creates a new variable called Sentiment that denotes whether the tweet was pro-gun or pro-gun control based
#on the hashtag. "grepl" replaces the first term in quotes with the second.
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
                    
#Split date and time into two different cols
dataTable$date <- as.Date(dataTable$created)
#Saves the data file as an output                    


