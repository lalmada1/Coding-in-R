


# IF YOU ARE GENERATING A GIF FROM R RASTER OBJECTS

library( caTools )

x <- y <- seq(-4*pi, 4*pi, len=200)
r <- sqrt(outer(x^2, y^2, "+"))
image = array(0, c(200, 200, 10))
for(i in 1:10) image[,,i] = cos(r-(2*pi*i/10))/(r^.25)

write.gif( image, "wave.gif", col="rainbow")





# FREE GIF GENERATOR

http://gifmaker.me/

# create a loop
# generate png files
# upload to website




# WITH IMAGEMAGICK

http://www.r-bloggers.com/animate-gif-images-in-r-imagemagick/


http://stackoverflow.com/questions/29166098/error-in-savegif-command-in-animation-package






library( animation )


# Direct the program to the exe file on your computer:

ani.options( convert = 'C:/Program Files/ImageMagick-6.9.2-Q16/convert.exe' )



# source the simulation functions:

https://github.com/lecy/regression-simulations/blob/master/README.md




saveGIF( expr={ confIntervalOfSlope( num.trials=100, samp.size=10, effect.size=3, slowSim=F ) }, 
         movie.name = "conf interval of slope effect3 samp10.gif", 
         interval = 0.1, 
         nmax = 100, 
         ani.width = 1200,
         ani.height = 600
       )



saveGIF( expr={ confIntervalOfSlope( num.trials=100, samp.size=25, effect.size=3, slowSim=F ) }, 
         movie.name = "conf interval of slope effect3 samp25.gif", 
         interval = 0.1, 
         nmax = 100, 
         ani.width = 1200,
         ani.height = 600
       )



saveGIF( expr={ confIntervalOfSlope( num.trials=100, samp.size=10, effect.size=7, slowSim=F ) }, 
         movie.name = "conf interval of slope effect7 samp10.gif", 
         interval = 0.1, 
         nmax = 100, 
         ani.width = 1200,
         ani.height = 600
       )





# confidence interval of slope sample size 10

saveGIF( expr={ sampDistOfSlope( num.trials=1000, samp.size=10, slowSim=F ) }, 
         movie.name = "samp dist slope sampsize10.gif", 
         interval = 0.1, 
         nmax = 100, 
         ani.width = 1200,
         ani.height = 600
       )

# increase sample size to decrease standard error

saveGIF( expr={ sampDistOfSlope( num.trials=1000, samp.size=50, slowSim=F ) }, 
         movie.name = "samp dist slope sampsize50.gif", 
         interval = 0.1, 
         nmax = 100, 
         ani.width = 1200,
         ani.height = 600
       )









library( animation )

ani.options(convert = 'C:/Program Files/ImageMagick-6.9.2-Q16/convert.exe')




saveGIF( expr={ measureErrorDV() }, 
         movie.name = "measurement error in dv.gif", 
         interval = 0.1, 
         nmax = 100, 
         ani.width = 1200,
         ani.height = 600
       )


saveGIF( expr={ measureErrorIVP() }, 
         movie.name = "measurement error in in pos.gif", 
         interval = 0.1, 
         nmax = 100, 
         ani.width = 1200,
         ani.height = 600
       )


saveGIF( expr={ measureErrorIVN() }, 
         movie.name = "measurement error in in neg.gif", 
         interval = 0.1, 
         nmax = 100, 
         ani.width = 1200,
         ani.height = 600
       )







measureErrorDV <- function()
{

slopes1 <- NULL

x <- 1:100 

for( i in 1:100 )
{

    z <- x + rnorm(100, 0, i/1 )
    plot( x, z, xlim= c(0,100), ylim=c(-300, 300 ), pch=19, col="gray", 
          cex=2.5,
          xlab="Independent Variable", ylab="Dependent Variable", 
          main="Measurement Error Added to the Dependent Variable" )
    abline( a=0, b=1 )
    r1 <- lm( z ~ x )
    abline( a= r1$coefficients[1], b= r1$coefficients[2], col="red", lwd=2 )

    slopes1[i] <- r1$coefficients[2]

}


}


measureErrorDV()



measureErrorIVP <- function()
{

slopes2 <- NULL

for( i in 1:100 )
{

    x <- 1:100 
    z <- x + rnorm(100, 0, i/1 )
    y <- 2*x + 10*rnorm(100)

    r2 <- lm( y ~ z )

    plot( z, y, xlim= c(-300,300), ylim=c(-500, 500 ), pch=19, col="gray",
          cex=2.5,
          xlab="Independent Variable", ylab="Dependent Variable", 
          main="Measurement Error Added to the Independent Variable: Attenuation Bias" )

    abline( a=0, b=2 )
    abline( a= r2$coefficients[1], b= r2$coefficients[2], col="red", lwd=2 )

    # slopes2[i] <- r2$coefficients[2]

}

}

measureErrorIVP()






measureErrorIVN <- function()
{

slopes2 <- NULL

for( i in 1:100 )
{

    x <- 1:100 
    z <- x + rnorm(100, 0, i/1 )
    y <- -2*x + 10*rnorm(100)

    r2 <- lm( y ~ z )

    plot( z, y, xlim= c(-300,300), ylim=c(-500, 500 ), pch=19, col="gray",
          cex=2.5,
          xlab="Independent Variable", ylab="Dependent Variable", 
          main="Measurement Error Added to the Independent Variable: Attenuation Bias" )

    abline( a=0, b=-2 )
    abline( a= r2$coefficients[1], b= r2$coefficients[2], col="red", lwd=2 )

    # slopes2[i] <- r2$coefficients[2]

}

}

measureErrorIVN()
