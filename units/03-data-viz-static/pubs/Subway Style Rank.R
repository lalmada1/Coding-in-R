

# CREATE FAKE DATA

x1 <- rnorm(10)
x2 <- x1 + rnorm(10)
x3 <- x2 + rnorm(10)
x4 <- x3 + rnorm(10)
x5 <- x4 + rnorm(10)

r1 <- rank(x1)
r2 <- rank(x2)
r3 <- rank(x3)
r4 <- rank(x4)
r5 <- rank(x5)

id <- LETTERS[1:10]

df <- data.frame( id, r1, r2, r3, r4, r5 )




# DATA FOR EXAMPLE

df <-
structure(list(id = structure(1:10, .Label = c("A", "B", "C", 
"D", "E", "F", "G", "H", "I", "J"), class = "factor"), r1 = c(10, 
6, 9, 7, 4, 2, 8, 1, 5, 3), r2 = c(10, 6, 8, 4, 2, 1, 9, 3, 7, 
5), r3 = c(10, 5, 7, 4, 2, 3, 9, 1, 8, 6), r4 = c(10, 4, 8, 3, 
2, 5, 9, 1, 7, 6), r5 = c(9, 3, 10, 4, 2, 5, 8, 1, 7, 6)), .Names = c("id", 
"r1", "r2", "r3", "r4", "r5"), row.names = c(NA, -10L), class = "data.frame")





id <- df$id
df <- df[ , -1 ]
ymin <- min(df)
ymax <- max(df)
num.x <- ncol(df)


plot.new()
plot.window( xlim=c(0,6), ylim=c(ymin,ymax) )

# abline( h=1:10, lwd=0.005, col=gray(0.7,0.5) )

for( i in 1:nrow(df) )
{
   points( 1:num.x, df[i,], type="p", cex=2, col=gray(0.5,0.5), 
           pch=21, bg="white" ) 
   points( 1:num.x, df[i,], type="c", lwd=6, col=gray(0.5,0.5) )
}

text( 0.7, 1:10, id[order(df[,1])], col=gray(0.5,0.5) )
text( 5.3, 1:10, id[order(df[,5])], col=gray(0.5,0.5) )

text( 0, 1:10, paste(10:1,"---"), col="gray80", cex=0.7 )
text( 6, 1:10, paste("---",10:1), col="gray80", cex=0.7 )

title( ylab="Rank", col.lab="gray80", cex.lab=1.2, line=1 )

axis( side=1, tick=F, at=1:5, labels=2011:2015, col.axis="gray", cex.axis=1 )
 
title( main="School Rank 2011-2015", col.main="gray50" )


# highlight a school

points( 1:5, df[2,], type="c", lwd=6, col="firebrick4" )
text( 0.7, df[2,1], "B", col="firebrick4" )
text( 5.3, df[2,5], "B", col="firebrick4" )

points( 1:5, df[6,], type="c", lwd=6, col="steelblue" )
text( 0.7, df[6,1], "F", col="steelblue" )
text( 5.3, df[6,5], "F", col="steelblue" )

points( 1:5, df[3,], type="c", lwd=6, col="goldenrod" )
text( 0.7, df[3,1], id[3], col="goldenrod" )
text( 5.3, df[3,5], id[3], col="goldenrod" )











### AS A FUNCTION


plotRows <- function( df )
{
  
  id <- df$id
  df <- df[ , -1 ]
  ymin <- min(df)
  ymax <- max(df)
  num.x <- ncol(df)


  plot( 1, 1, xlim=c(0,num.x+1), ylim=c(ymin,ymax), bty="n",
        type="n", xaxt="n", yaxt="n", xlab="", ylab="" )

  # abline( h=1:10, lwd=0.005, col=gray(0.7,0.5) )

  for( i in 1:nrow(df) )
  {
     points( 1:num.x, df[i,], type="p", cex=2, col=gray(0.5,0.5), 
             pch=21, bg="white" ) 
     points( 1:num.x, df[i,], type="c", lwd=6, col=gray(0.5,0.5) )
  }

  text( 0.7, 1:10, id[order(df[,1])], col=gray(0.5,0.5) )
  text( 5.3, 1:10, id[order(df[,5])], col=gray(0.5,0.5) )

  text( 0, 1:10, paste(10:1,"---"), col=gray(0.5,0.5), cex=0.7 )
  #text( 6, 1:10, 10:1, col=gray(0.5,0.5), cex=0.7 )

  title( ylab="Rank", col.lab="gray", cex.lab=0.9, line=0.1 )
  
  axis( side=1, tick=F, at=1:5, labels=2011:2015, col.axis="gray", cex.axis=0.8 )
  
}



