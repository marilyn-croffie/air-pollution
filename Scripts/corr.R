corr <- function(directory, threshold=0){
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all variables)
        ## required to compute the correlation between nitrate and sulfate;
        ## the default is 0
        
        # Return a numeric vector of correlations
        # Note: Do not round the result!
        
        base_dir <- "C:/Users/Esiey/R/Projects/Air Pollution/Data"
        target_dir <- paste(base_dir, directory,sep = "/")
        all_files <- list.files(target_dir)
        source("complete.R")
        obs <- complete(directory)
        corr <- numeric()
        
        select_file_ids <- subset(obs,nobs>threshold)$id
        
        for(i in select_file_ids){
                select_file_path <- paste(target_dir,all_files[i], sep = "/")
                select_file_data <- read.csv(select_file_path)
                good_data <- select_file_data[complete.cases(select_file_data), ]
                sulfate <- good_data[,"sulfate"]
                nitrate <- good_data[,"nitrate"]
                x <- cor(sulfate,nitrate)
                corr <- c(corr, x)
        }
        
        corr
}