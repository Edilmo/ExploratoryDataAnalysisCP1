## These functions allows to reuse the House Hold Power Consumpotion Data.
## After the first call of readDaysData the next calls to this function
## will return the same variable data.to.plot

## Loads House Hold Power Consumpotion Data in a Data Frame
readDaysData <- function(file = "household_power_consumption.txt", 
                         start.day = as.Date("2007-02-01"), 
                         end.day = as.Date("2007-02-02")) {
        ## 'file' is a character vector with the name of the data file
        ## 'start.day' is a Date object that indicates the start day to load 
        ## since
        ## 'end.day' is a Date object that indicates the end day to load 
        
        ## Return a data frame with the data
        
        ## Check if the cache
        if(exists("data.to.plot") && !is.null(data.to.plot)) {
                return(data.to.plot)
        }
        ## Read all lines from the file
        temp.lines<-readLines(temp<-file(file))
        close(temp)
        ## Start date as string
        temp.start.day<-format(start.day,format = "%e/%m/%Y")
        ## Remove leading white space in start day
        temp.start.day<-sub("^[[:space:]]+","",temp.start.day)
        ## Remove leading zeros in start day
        temp.start.day<-sub("/0","/",temp.start.day)
        ## End date as string
        temp.end.day<-format(end.day,format = "%e/%m/%Y")
        ## Remove leading white space in end day
        temp.end.day<-sub("^[[:space:]]+","",temp.end.day)
        ## Remove leading zeros in end day
        temp.end.day<-sub("/0","/",temp.end.day)
        ## Pattern to grep the file
        pattern<-paste0("^",temp.start.day,";|^",temp.end.day,";")
        ## Grep lines
        temp.grep.lines<-grep(pattern,temp.lines)
        ## Subsetting header and lines with specific dates
        temp.lines<-temp.lines[c(1,temp.grep.lines)]
        ## Concatenating Date and Time
        temp.lines<-sub(";"," ",temp.lines)
        # Defining a custom date time class and conversion functions
        as.POSIXct.D<-function(from){as.POSIXct(from,format="%e/%m/%Y %H:%M:%S")}
        as.Character.DC<-function(from,value){format(value,format = "%e/%m/%Y %H:%M:%S")}
        setClass("as.POSIXct.D.C",contains = "POSIXct")
        setAs("character","as.POSIXct.D.C",as.POSIXct.D,as.Character.DC)
        # Loading the data frame and putting it in the cache
        data.to.plot<<-read.table(text = temp.lines, header = TRUE, na.strings = "?", sep=";", colClasses = c("as.POSIXct.D.C",rep("numeric",7)))
        ## return the data
        data.to.plot
}

## Method used to test every thing
test <- function() {
        plot1()
        plot2()
        plot3()
        plot4()

        ##Start Temp code
#        file <- "household_power_consumption.txt"
#        start.day <- as.Date("2007-02-01")
#        end.day <- as.Date("2007-02-02")
#         temp.grep.lines1<-grep("^1/2/2007;",temp.lines)
#         temp.grep.lines2<-grep("^2/2/2007;",temp.lines)
#         temp.grep.linesT<-grep("^1/2/2007;|^2/2/2007;",temp.lines)
#         
#         temp.linesF<-temp.lines[c(1,temp.grep.lines)]
#         head(temp.linesF)
#         
#         data1<-read.table(text = temp.lines, header = TRUE, na.strings = "?", sep=";")
#         as.POSIXct.D<-function(from){as.POSIXct(from,format="%e/%m/%Y %H:%M:%S")}
#         as.Character.DC<-function(from,value){format(value,format = "%e/%m/%Y %H:%M:%S")}
#         setClass("as.POSIXct.D.C",contains = "POSIXct")
#         setAs("character","as.POSIXct.D.C",as.POSIXct.D,as.Character.DC)
#         data2<-read.table(text = temp.lines, header = TRUE, na.strings = "?", sep=";", colClasses = c("as.POSIXct.D.C",rep("numeric",7)))
#         
#         plot(data.to.plot[[1]],data.to.plot[[6]],col=1,type = "l",xlab = "Datetime",ylab = "Energy sub metering")
#         plot(data.to.plot[[1]],data.to.plot[[7]],col=2,type = "l",xlab = "Datetime",ylab = "Energy sub metering")
#         plot(data.to.plot[[1]],data.to.plot[[8]],col=4,type = "l",xlab = "Datetime",ylab = "Energy sub metering")
#         plot(rep(data.to.plot[[1]],3),c(data.to.plot[[6]],data.to.plot[[7]],data.to.plot[[8]]),col=rep(1:3,each=nrow(data.to.plot)),type = "l",xlab = "Datetime",ylab = "Energy sub metering")
#         matplot(data.to.plot[[1]],data.to.plot[6:8],col=c(1,2,4),type = "l",xlab = "Datetime",ylab = "Energy sub metering",lty = 1)
#         matplot(data.to.plot[[1]],data.to.plot[6:8],col=c(1,2,4),type = "l",xlab = "Datetime",ylab = "Energy sub metering",lty = 1,xaxp=c(data.to.plot[[1]][1],data.to.plot[[1]][length(data.to.plot[[1]])],2))
        ##End Temp code
}