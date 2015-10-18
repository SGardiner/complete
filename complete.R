complete <- function(directory, id = 1:332) {
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
        
        ## Steps: 1) create data frame for the output with column names id and nobs
        ## 2) create temp logical vector for complete cases
        ## 3) cycle through files for each id value and sum complete cases to store in nobs data frame
        
        nobs <- data.frame(nrow = length(id), ncol = 2)  # create data frame for output
        names(nobs) <- c("id", "nobs")   # name the columns in data frame
        files <- list.files(directory, full.names = TRUE) # create list of file names
        
        for (i in 1:length(id)) {
                comp <-complete.cases(read.csv(files[id[i]])) # create temp vector with complete.cases
                nobs[i,] <- c(id[i],sum(comp))  # store id number and number of complete cases
        }
        
        nobs # return the data frame
        
}