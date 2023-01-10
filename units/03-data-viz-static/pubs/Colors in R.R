### COLORS IN R


x <- 1:15

# create color vector

my.colors <- rep( NA, length(x) )
my.colors[ 1:5 ] <- "chartreuse4"
my.colors[ 6:10 ] <- "goldenrod2"
my.colors[ 11:15 ] <- "hotpink"

plot( x, pch=19, cex=6, col=my.colors )


### PALETTE

palette()

plot( 1:3, col=1:3, pch=19, cex=10 )

plot( 1:24, col=as.factor(1:24), pch=19, cex=10, main="8 Color Palette" )




palette( rainbow( 4 ) )

palette()

plot( 1:24, col=as.factor(1:24), pch=19, cex=10, main="4 Color Palette" )



palette( c("gray20","gray50","gray80") )

palette()

plot( 1:24, col=as.factor(1:24), pch=19, cex=10, main="4 Color Palette" )





### COLOR FUNCTIONS

color.function <- colorRampPalette( c("red", "gray80", "blue"), space = "Lab" )

color.function( 5 )

plot( 1:5, col=color.function(5), pch=19, cex=10, bg="gray" )


