### GRAPHING BASICS


# create some data for a scatterplot

fertilizer <- 1:100

corn.height <- 250 + 2*fertilizer + 20*rnorm(100) - 0.02*fertilizer^2

plot( x=fertilizer, y=corn.height )





plot( 
      x=fertilizer, y=corn.height,
      xlab="Fertilizer (mg)",
      ylab="Corn Height (cm)",
      main="Relationship Between Fertilizer Intensity and Corn Growth"    
    )





# DEMO COLORS

demo( "colors" )





# DEMO POINTS

pchShow <-
  function(extras = c("*",".", "o","O","0","+","-","|","%","#"),
           cex = 3, ## good for both .Device=="postscript" and "x11"
           col = "darkgray", bg = "gold", coltext = "black", cextext = 1.2,
           main = paste("plot symbols :  points (...  pch = *, cex =",
                        cex,")"))
  {
    nex <- length(extras)
    np  <- 26 + nex
    ipch <- 0:(np-1)
    k <- floor(sqrt(np))
    dd <- c(-1,1)/2
    rx <- dd + range(ix <- ipch %/% k)
    ry <- dd + range(iy <- 3 + (k-1)- ipch %% k)
    pch <- as.list(ipch) # list with integers & strings
    if(nex > 0) pch[26+ 1:nex] <- as.list(extras)
    plot(rx, ry, type = "n", axes  =  FALSE, xlab = "", ylab = "", main = main)
    abline(v = ix, h = iy, col = "lightgray", lty = "dotted")
    for(i in 1:np) {
      pc <- pch[[i]]
      ## 'col' symbols with a 'bg'-colored interior (where available) :
      points(ix[i], iy[i], pch = pc, col = col, bg = bg, cex = cex)
      if(cextext > 0)
          text(ix[i] - 0.3, iy[i], pc, col = coltext, cex = cextext)
    }
  }




# help( pch )
  
pchShow()





plot( 
      x=fertilizer, y=corn.height,
      xlab="Fertilizer (mg)",
      ylab="Corn Height (cm)",
      main="Relationship Between Fertilizer Intensity and Corn Growth",
      pch=19, 
      col="darkgoldenrod2",
      cex=2      
    )
    





# OPEN UP SOME WHITE SPACE


plot( 
      x=fertilizer, y=corn.height,
      xlab="Fertilizer (mg)",
      ylab="Corn Height (cm)",
      main="Relationship Between Fertilizer Intensity and Corn Growth",
      pch=19, 
      col="darkgoldenrod2",
      cex=2,
      bty="n"
    )


plot( 
      x=fertilizer, y=corn.height,
      xlab="Fertilizer (mg)",
      ylab="Corn Height (cm)",
      main="Relationship Between Fertilizer Intensity and Corn Growth",
      pch=19, 
      col="darkgoldenrod2",
      cex=2,
      bty="L"
    )
    
    
    
    
    
# ADD A TREND LINE

plot( 
      x=fertilizer, y=corn.height,
      xlab="Fertilizer (mg)",
      ylab="Corn Height (cm)",
      main="Relationship Between Fertilizer Intensity and Corn Growth",
      pch=19, 
      col="gray",
      cex=2,
      bty="n"
    )

lines( lowess( fertilizer, corn.height ), col="darkgoldenrod2", lwd=4 )





# ANNOTATE SOME POINTS

this.one <- which.max( corn.height )

tallest.x <- fertilizer[ this.one ]

tallest.y <- corn.height[ this.one ]

plot( 
      x=fertilizer, y=corn.height,
      xlab="Fertilizer (mg)",
      ylab="Corn Height (cm)",
      main="Relationship Between Fertilizer Intensity and Corn Growth",
      pch=19, 
      col="gray",
      cex=2,
      bty="n"
    )

lines( lowess( fertilizer, corn.height ), col="darkgoldenrod2", lwd=4 )

points( x=tallest.x, y=tallest.y, cex=2.5, col="darkgoldenrod2" )

text( x=tallest.x, y=tallest.y, labels="Tallest Stalk", pos=4, col="darkgoldenrod2" )




# EXAMPLES

library( Lahman )

data( Master )

names( Master )

plot( Master$height, Master$weight, pch=19, col="gray", cex=1.5 )

t1 <- tapply( Master$weight, Master$height, mean, na.rm=T )

points( names(t1), t1, pch=19, col="red", cex=1.5 )



# abline( lm( corn.height ~ fertilizer + fertilizer^2  ), col="red" )




data( Teams )

plot( Teams$H, Teams$W, pch=19, col="gray" )

lines( lowess( Teams$H, Teams$W ), col="red", lwd=4 )


# identify( Teams$H, Teams$W, Teams$name )

plot( Teams$ERA, Teams$W, pch=19, col="gray" )

lines( lowess( Teams$ERA, Teams$W ), col="red", lwd=4 )


era.20.bins <- cut( rank( Teams$ERA), breaks=20 )

t2 <- tapply( Teams$W, era.20.bins, mean, na.rm=T )
t3 <- tapply( Teams$ERA, era.20.bins, mean, na.rm=T )

points( t3, t2, pch=19, col="red", cex=2 )
