## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)
## NOTE: Do not round the result!
pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  files <- list.files(directory)
  filepaths <- paste(directory, "/", files, sep="")
  ## Creates the file paths for loading in the data
  poll <- if (pollutant == "sulfate") {
            2
        } else {
            3
      }
  ##creates vector to select the column
  ##dependent on the pollutant selected
  workingM <- matrix(NA,0,4)
  ##creates an empty matrix workingM with no rows and 4 colums 
  ##relfecting the underlying datasets
  for (i in id) {
      data <- read.csv(filepaths[i])
      workingM <- rbind(workingM, data)
    }
  ## populates the matrix by adding each additional i data set into workingM
  mean(workingM[,poll], na.rm=TRUE)
}

##prints the results unrounded
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)