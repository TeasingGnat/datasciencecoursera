## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases

complete <- function(directory, id = 1:332) {
      files <- list.files(directory)
      filepaths <- paste(directory, "/", files, sep="")
      ## Creates the file paths for loading in the data
  
      nobs <- numeric() 
      ## creates an empty numeric vector called nobs
      for (i in id) {
          nobs <- c(nobs, nrow(na.omit(read.csv(filepaths[i]))))
      }   
      ##populates the nobs vector with the number of observations (nrow)
      ##from the files
      ## na.omit removes the NA line observations
 
      tab <- data.frame(id, nobs)
      tab
}
## Prints data
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)