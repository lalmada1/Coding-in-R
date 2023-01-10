dat <-
structure(list(x = 1:20, y = c(5.11377210954213, 4.87676585462146, 
1.73292223543421, 4.0000940909812, 4.68491930067767, 13.4911961059188, 
1.46318169260656, 11.8149739020458, 9.58245499487749, 6.96836872653941, 
4.41292043169896, 9.36607534465413, 15.0618701361347, 11.7283718808769, 
17.3415880445104, 13.0514729073716, 15.5048228247731, 21.0577447861862, 
15.7838356563658, 24.0002049977631), z = 1:20), .Names = c("x", 
"y", "z"), row.names = c(NA, -20L), class = "data.frame")

x <- dat$x
y <- dat$y
z <- dat$z



#########################

xmin <- min(x)-2
xmax <- max(x)+2
ymin <- min(y)-2
ymax <- max(y)+2


plot.new()
plot.window( xlim=c(xmin,xmax), ylim=c(ymin,ymax) )

points( x, y, pch=1, cex=2, col="black", bty="n" )

lines( x, z, col="firebrick", lwd=2 )

segments( x0=x, y0=y, y1=z, col="black", lty=2 )

points( x, y, pch=19, cex=1, col="black", bty="n" )



# TEXT

id <- LETTERS[1:20]
text( x, y, id, pos=4 )

position <- rep( 1, 20 )
position[ y > z ] <- 3

text( x, y, id, pos=position )



# AXES AND TITLE

axis( side=1 )
axis( side=2 )

axis( side=1, at=c(1,20), labels=c("Low","High") )
axis( side=2, at=c(0,25), labels=c("Low","High") )

title( xlab="Moxie" )
title( ylab="Karma" )



# IDENTIFY

id <- LETTERS[1:20]

identify( x, y, id )






############# CREATE DATA

x <- 1:20
y <- x + rnorm(20,0,3)
z <- x

dat <- data.frame( x,y,z)
dput( dat )




