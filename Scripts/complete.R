complete <- function(directory, id=1:332){
        ## 'directory is a character vector of length 1 indicating
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
        
        base_dir <- "C:/Users/Esiey/R/Projects/Air Pollution/Data"
        target_dir <- paste(base_dir, directory,sep = "/")
        all_files <- list.files(target_dir)
        complete <- data.frame()
        
        for(i in id){
                f <- read.csv(paste(target_dir,all_files[i], sep = "/"))
                d <- dim(f[complete.cases(f),])
                new_row <- c(i,d[[1]])
                complete <- rbind(complete,new_row)
        }
        
        colnames(complete) <- c("id","nobs")
        complete
}