pollutantmean <- function(directory,pollutant,id=1:332){
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "Sulfate" or "nitrate"
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!
        
        base_dir <- "C:/Users/Esiey/R/Projects/Air Pollution/Data"
        target_dir <- paste(base_dir, directory,sep = "/")
        all_files <- list.files(target_dir)
        total <- numeric()
        
        for(i in id){
                f <- read.csv(paste(target_dir,all_files[i], sep = "/"))
                d <- f[complete.cases(f),pollutant]
                total <- c(total,d)
        }
        
        avg <- mean(total)
        avg
}