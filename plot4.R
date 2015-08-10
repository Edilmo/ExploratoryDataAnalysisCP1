## Generates a Multi-Plot of four scatter plots:
## 1.- Global Active power during a two days period
## 2.- Voltage during a two days period
## 3.- Three energy sub metering during a two days period
## 4.- Global Reactive power during a two days period
plot4 <- function() {
        data <- readDaysData()
        png(filename = "plot4.png",width = 480,height = 480)
        par(mfrow = c(2, 2))
        ## Plot in cel 1-1, Global active power
        plot(data.to.plot[[1]],data.to.plot[[2]],type = "l",xlab = "Datetime",ylab = "Global Active Power")
        ## Plot in cel 1-2
        plot(data.to.plot[[1]],data.to.plot[[4]],type = "l",xlab = "Datetime",ylab = "Voltage")
        ## Plot in cel 2-1, Energy sub metering
        plot(rep(data[[1]],3),c(data[[6]],data[[7]],data[[8]]),col=rep(c(1,2,4),each=nrow(data)),type = "p",xlab = "Datetime",ylab = "Energy sub metering",pch=46)
        lines(data[[1]],data[[6]],col=1)
        lines(data[[1]],data[[7]],col=2)
        lines(data[[1]],data[[8]],col=4)
        legend("topright",lty = 1,col = c(1,2,4),legend = colnames(data)[6:8],cex = 0.3)
        ## Plot in cel 2-2, Global Reactive Power
        plot(data.to.plot[[1]],data.to.plot[[3]],type = "l",xlab = "Datetime",ylab = "Global Reactive Power")

        dev.off()
}