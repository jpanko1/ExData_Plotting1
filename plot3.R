# Read and setup data
data0 <- read.csv( 
    "household_power_consumption.txt" , 
    sep=";" , 
    na.strings="?" 
  )

data0$dt <- strptime( 
    paste( data0$Date , data0$Time ) , 
    format="%d/%m/%Y %H:%M:%S" 
  )

data <- data0[ 
    !is.na(data0$dt) 
    & data0$dt > strptime( "2007-01-31 23:59:00" , format="%Y-%m-%d %H:%M:%S" ) 
    & data0$dt < strptime( "2007-02-03" , format="%Y-%m-%d" ) 
  , ]

# Plot
png( filename="plot3.png" )
plot(
      data$dt ,
      data$Sub_metering_1 ,
      type="l" ,
      xlab="" ,
      ylab="Energy sub metering"
)
lines(
      data$dt ,
      data$Sub_metering_2 ,
      col="red"
)
lines(
      data$dt ,
      data$Sub_metering_3 ,
      col="blue"
)
legend(
      "topright" ,
      legend=c(
        "Sub_metering_1" ,
        "Sub_metering_2" ,
        "Sub_metering_3"
      ) ,
      col=c(
        "black" ,
        "red" ,
        "blue"
      ) ,
      lty="solid"
)
dev.off()
