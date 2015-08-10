## Plot a scatter plot of three energy sub metering during a two days period
plot3 <- function() {
        data <- readDaysData()
        png(filename = "plot3.png",width = 480,height = 480)
        plot(rep(data[[1]],3),c(data[[6]],data[[7]],data[[8]]),col=rep(c(1,2,4),each=nrow(data)),type = "p",xlab = "Datetime",ylab = "Energy sub metering",pch=46)
        lines(data[[1]],data[[6]],col=1)
        lines(data[[1]],data[[7]],col=2)
        lines(data[[1]],data[[8]],col=4)
        legend("topright",lty = 1,col = c(1,2,4),legend = colnames(data)[6:8],cex = 0.5)
        dev.off()
}