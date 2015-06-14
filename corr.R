## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0

## Return a numeric vector of correlations
## NOTE: Do not round the result!

corr <- function(directory, threshold = 0) {
  
  files <- list.files(directory)
  filepaths <- paste(directory, "/", files, sep="")
  ## Creates the file paths for loading in the data
  
  table1 <- complete(directory, )
  ## runs compete to give a full list of id's and observations
  table2 <- table1[table1["nobs"]>threshold,]$id
  ## limits this to those over the threshold 
  ## the $id ensures it returns the id values
  corrV <- numeric() 
  ## creates an empty numeric vector called corr
  
  for (i in table2) {
    table3 <- read.csv(filepaths[i])
    ## reads in files to where they are in table 2
    table4 = table3[complete.cases(table3), ]
    ## reads only complete cases in i.e. no NA's
    ## originally tried na.omit it produced output but had an error
    corrV = c(corrV, cor(table4$sulfate, table4$nitrate))
    ## populates the corrV vector with the correlations of pollutants
    ## in each of the tables
  }
   return(corrV)
  ## my code was not working a google search brought up this it fixed to code
}
## prints results
cr <- corr("specdata", 150)
head(cr)  

summary(cr)

cr <- corr("specdata", 5000)
summary(cr)

length(cr)

cr <- corr("specdata")
summary(cr)

length(cr)
 