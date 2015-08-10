## Plot a scatter plot of the Global Active power during a two days period
plot2 <- function() {
        data <- readDaysData()
        png(filename = "plot2.png",width = 480,height = 480)
        plot(data.to.plot[[1]],data.to.plot[[2]],type = "l",xlab = "Datetime",ylab = "Global Active Power (Kilowatts)")
        dev.off()
}