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
png( filename="plot1.png" )
hist(
      data$Global_active_power ,
      col="red" ,
      main="Global Active Power" ,
      xlab="Global Active Power (kilowatts)"
)
dev.off()
