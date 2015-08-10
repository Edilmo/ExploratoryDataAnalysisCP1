## Plot a histogram of the Global Active power during a two days period
plot1 <- function() {
        data <- readDaysData()
        png(filename = "plot1.png",width = 480,height = 480)
        hist(data[[2]],col = 2,main = "Global Active Power",ylim = c(0,1200),xlab = "Global Active Power (Kilowatts)")
        dev.off()
}