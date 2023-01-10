
# EXAMPLE OF BUILDING A SUBWAY MAP STYLE RANK PLOT
#
# Modeled after:
# http://jkunst.com/r/what-do-we-ask-in-stackoverflow/
# http://jkunst.com/images/what-do-we-ask-in-stackoverflow/unnamed-chunk-9-1.png




### LOAD FAKE DATA ON SCHOOL RANKS

df <- structure(list(id = structure(1:10, .Label = c("A", "B", "C", 
"D", "E", "F", "G", "H", "I", "J"), class = "factor"), r1 = c(10, 
6, 9, 7, 4, 2, 8, 1, 5, 3), r2 = c(10, 6, 8, 4, 2, 1, 9, 3, 7, 
5), r3 = c(10, 5, 7, 4, 2, 3, 9, 1, 8, 6), r4 = c(10, 4, 8, 3, 
2, 5, 9, 1, 7, 6), r5 = c(9, 3, 10, 4, 2, 5, 8, 1, 7, 6)), .Names = c("id", 
"r1", "r2", "r3", "r4", "r5"), row.names = c(NA, -10L), class = "data.frame")




### BASELINE PLOT WITH LINES ONLY

id <- df[,1]
y11 <- df[,2]
y15 <- df[,6]

# empty plot
plot.new()
plot.window( xlim=c(0,4), ylim=c(1,10) )

segments( x0=1, x1=3, y0=y11, y1=y15 )

text( 3.5, 1:10, id[order(df[,6])] )

axis( side=1, at=c(1,3), labels=c("2011","2015"), tick=F )

title( ylab="School Rank", line=0 )
title( main="School Rank 2011-2015" )






### FIRST ATTEMPT - type="l" FOR LINES


# create some global variables

id <- df$id          # save ID as separate variable
df <- df[ , -1 ]     # drop ID from the dataset so it's all numeric
ymin <- min(df)      # what is the largest value in the data frame?
ymax <- max(df)      # what is the smallest value in the data frame?
num.x <- 5           # we have five years of data



# create an empty plot with the correct dimensions for our plot
plot.new()
plot.window( xlim=c(0,6), ylim=c(ymin,ymax) )


points( 1:5, df[1,], type="l" )  # school A
points( 1:5, df[2,], type="l" )  # school B
points( 1:5, df[3,], type="l" )
points( 1:5, df[4,], type="l" )
points( 1:5, df[5,], type="l" )
points( 1:5, df[6,], type="l" )
points( 1:5, df[7,], type="l" )
points( 1:5, df[8,], type="l" )
points( 1:5, df[9,], type="l" )
points( 1:5, df[10,], type="l" ) # school J


text( x=0.5, y=10, labels="A" ) # rank in 2011
text( x=5.5, y=9, labels="A" )  # rank in 2015






### SECOND ATTEMPT - type="b" FOR BOTH

plot.new()
plot.window( xlim=c(0,6), ylim=c(ymin,ymax) )

points( 1:5, df[1,], type="b" ) 
points( 1:5, df[2,], type="b" ) 
points( 1:5, df[3,], type="b" ) 
points( 1:5, df[4,], type="b" )
points( 1:5, df[5,], type="b" )
points( 1:5, df[6,], type="b" )
points( 1:5, df[7,], type="b" )
points( 1:5, df[8,], type="b" )
points( 1:5, df[9,], type="b" )
points( 1:5, df[10,], type="b" )


text( x=0.5, y=10, labels="A" ) # rank in 2011
text( x=5.5, y=9, labels="A" )  # rank in 2015




### THIRD ATTEMPT - lwd=5 FOR LINE WIDTH, cex=2 FOR POINT SIZE

plot.new()
plot.window( xlim=c(0,6), ylim=c(ymin,ymax) )

points( 1:5, df[1,], type="b", lwd=5, cex=2 )
points( 1:5, df[2,], type="b", lwd=5, cex=2 )
points( 1:5, df[3,], type="b", lwd=5, cex=2 )
points( 1:5, df[4,], type="b", lwd=5, cex=2 )
points( 1:5, df[5,], type="b", lwd=5, cex=2 )
points( 1:5, df[6,], type="b", lwd=5, cex=2 )
points( 1:5, df[7,], type="b", lwd=5, cex=2 )
points( 1:5, df[8,], type="b", lwd=5, cex=2 )
points( 1:5, df[9,], type="b", lwd=5, cex=2 )
points( 1:5, df[10,], type="b", lwd=5, cex=2 )


text( x=0.5, y=10, labels="A" ) # rank in 2011
text( x=5.5, y=9, labels="A" )  # rank in 2015




### FOURTH ATTEMPT - type="p" FOR POINTS, type="c" FOR LINES

plot.new()
plot.window( xlim=c(0,6), ylim=c(ymin,ymax) )

points( 1:5, df[1,], type="p", cex=2 )
points( 1:5, df[2,], type="p", cex=2 )
points( 1:5, df[3,], type="p", cex=2 )
points( 1:5, df[4,], type="p", cex=2 )
points( 1:5, df[5,], type="p", cex=2 )
points( 1:5, df[6,], type="p", cex=2 )
points( 1:5, df[7,], type="p", cex=2 )
points( 1:5, df[8,], type="p", cex=2 )
points( 1:5, df[9,], type="p", cex=2 )
points( 1:5, df[10,], type="p", cex=2 )

points( 1:5, df[1,], type="c", lwd=5 )
points( 1:5, df[2,], type="c", lwd=5 )
points( 1:5, df[3,], type="c", lwd=5 )
points( 1:5, df[4,], type="c", lwd=5 )
points( 1:5, df[5,], type="c", lwd=5 )
points( 1:5, df[6,], type="c", lwd=5 )
points( 1:5, df[7,], type="c", lwd=5 )
points( 1:5, df[8,], type="c", lwd=5 )
points( 1:5, df[9,], type="c", lwd=5 )
points( 1:5, df[10,], type="c", lwd=5 )

text( x=0.5, y=10, labels="A" ) # rank in 2011
text( x=5.5, y=9, labels="A" )  # rank in 2015




### ADD LABELS, AXES, AND TITLE

plot.new()
plot.window( xlim=c(0,6), ylim=c(ymin,ymax) )

points( 1:5, df[1,], type="p", cex=2 )
points( 1:5, df[2,], type="p", cex=2 )
points( 1:5, df[3,], type="p", cex=2 )
points( 1:5, df[4,], type="p", cex=2 )
points( 1:5, df[5,], type="p", cex=2 )
points( 1:5, df[6,], type="p", cex=2 )
points( 1:5, df[7,], type="p", cex=2 )
points( 1:5, df[8,], type="p", cex=2 )
points( 1:5, df[9,], type="p", cex=2 )
points( 1:5, df[10,], type="p", cex=2 )

points( 1:5, df[1,], type="c", lwd=5 )
points( 1:5, df[2,], type="c", lwd=5 )
points( 1:5, df[3,], type="c", lwd=5 )
points( 1:5, df[4,], type="c", lwd=5 )
points( 1:5, df[5,], type="c", lwd=5 )
points( 1:5, df[6,], type="c", lwd=5 )
points( 1:5, df[7,], type="c", lwd=5 )
points( 1:5, df[8,], type="c", lwd=5 )
points( 1:5, df[9,], type="c", lwd=5 )
points( 1:5, df[10,], type="c", lwd=5 )

text( 0.7, 1:10, id[order(df[,1])] )
text( 5.3, 1:10, id[order(df[,5])] )

text( 0, 1:10, paste(10:1,"---") )
text( 6, 1:10, paste("---",10:1) )

title( ylab="Rank", line=1 )
axis( side=1, tick=F, at=1:5, labels=2011:2015 )
title( main="School Rank 2011-2015"  )





### CHANGE COLORS AND TRANSPARENCY

plot.new()
plot.window( xlim=c(0,6), ylim=c(ymin,ymax) )

# add each row to a loop instead of repeating lines of code

for( i in 1:nrow(df) )
{
   points( 1:num.x, df[i,], type="p", cex=1.5, col=gray(0.5,0.5), 
           pch=21, bg="white" ) 
           
   points( 1:num.x, df[i,], type="c", lwd=6, col=gray(0.5,0.5) )
}



text( 0.7, 1:10, id[order(df[,1])], col=gray(0.5,0.5) )
text( 5.3, 1:10, id[order(df[,5])], col=gray(0.5,0.5) )

text( 0, 1:10, paste(10:1,"---"), col="gray80", cex=0.7 )
text( 6, 1:10, paste("---",10:1), col="gray80", cex=0.7 )

title( ylab="Rank", col.lab="gray80", cex.lab=1.5, line=1 )

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