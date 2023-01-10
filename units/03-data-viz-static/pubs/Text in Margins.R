
### TEXT IN MARGINS



# Generate data  

x = 0:10;  
y = 0:10;  
  
# Setting Margins for the Plot:  

par(oma=c(3,3,3,3))


# - oma stands for 'Outer Margin Area', or the total margin space that is outside  
#   of the standard plotting region (see graph)
#
#   In this example all sides have 3 lines of space
# 
# - Specify the layout parameters before any plotting  
#   If you don't specify them before any plotting, the  
#   results will be inconsistent and misaligned.  
#  
# - The vector is ordered, the first value corresponding to the bottom. The entire  
#   array is c(bottom, left, top, right)  
#  
# - All of the alternatives are:  
#   - oma: Specify width of margins in number of lines  
#   - omi: Specify width of margins in inches  
#   - omd: Specify width of margins in 'device coordinates'  
#       - Device coordinates place (0,0) in the upper left and (1,1) in the  
#         lower right corner  


    
par(mar=c(5,4,4,2) + 0.1) 
  
# - The mar command represents the figure margins. The vector is in the same ordering of  
#   the oma commands.  
#   
# - The default size is c(5,4,4,2) + 0.1, (equivalent to c(5.1,4.1,4.1,2.1)).   
#  
# - The axes tick marks will go in the first line of the left and bottom with the axis  
#   label going in the second line.  
#  
# - The title will fit in the third line on the top of the graph.   
#  
# - All of the alternatives are:  
#   - mar: Specify the margins of the figure in number of lines  
#   - mai: Specify the margins of the figure in number of inches  
  
  
  
# Plot: type="n" hides the points

plot( x, y, type="n", xlab="", ylab="", axes=FALSE )  
   
box( col="green" )  
  
# Place text in the margins and label the margins, all in darkorange3  
mtext("Margins", side=3, line=2, cex=2, col="darkorange3")  
mtext("par(mar=c(5,4,4,2) + 0.1)", side=3, line=1, cex=1, col="darkorange3")  
mtext("Line 0", side=3, line=0, adj=1.0, cex=1, col="darkorange3")  
mtext("Line 1", side=3, line=1, adj=1.0, cex=1, col="darkorange3")  
mtext("Line 2", side=3, line=2, adj=1.0, cex=1, col="darkorange3")  
mtext("Line 3", side=3, line=3, adj=1.0, cex=1, col="darkorange3")  
mtext("Line 0", side=2, line=0, adj=1.0, cex=1, col="darkorange3")  
mtext("Line 1", side=2, line=1, adj=1.0, cex=1, col="darkorange3")  
mtext("Line 2", side=2, line=2, adj=1.0, cex=1, col="darkorange3")  
mtext("Line 3", side=2, line=3, adj=1.0, cex=1, col="darkorange3")  
box("figure", col="darkorange3")  
  

# Label the outer margin area and color it blue  
# Note the 'outer=TRUE' command moves us from the figure margins to the outer  
# margins.  
mtext("Outer Margin Area", side=1, line=1, cex=2, col="blue", outer=TRUE)  
mtext("par(oma=c(3,3,3,3))", side=1, line=2, cex=1, col="blue", outer=TRUE)  
mtext("Line 0", side=1, line=0, adj=0.0, cex=1, col="blue", outer=TRUE)  
mtext("Line 1", side=1, line=1, adj=0.0, cex=1, col="blue", outer=TRUE)  
mtext("Line 2", side=1, line=2, adj=0.0, cex=1, col="blue", outer=TRUE)  
box("outer", col="blue") 

mtext( "This is mtext", side=2, outer=T, line=1, col="blue" )


axis( side=1 )
axis( side=2 )
title( xlab="X" )
title( xlab="X", line=0 )
title( xlab="X", line=1 )
title( xlab="X", line=2 )
title( xlab="X", line=4 )








### SMALL MULTIPLES EXAMPLE

par( mfrow=c(2,2) )
# add an outer margin and change inner margins
par( oma=c(3,3,0,0), mar=c(2,3,2,1) )
plot( rnorm(100), main="Plot 1", ylab="", xlab="", xaxt="n")
plot( rnorm(100), main="Plot 2", ylab="", xlab="", xaxt="n", yaxt="n")
plot( rnorm(100), main="Plot 3", ylab="", xlab="")
plot( rnorm(100), main="Plot 4", ylab="", xlab="", yaxt="n")
# add text to the outer margin
mtext( "One Y-Axis Label", side=2, outer=T, line=1 )
mtext( "One X-Axis Label", side=1, outer=T, line=1 )












dat1 <- 
structure(list(yos = 0:15, nonvet4 = c(4, 4.40187, 4.96076, 5.47486, 
5.95588, 6.3027, 6.54668, 6.81418, 7.08307, 7.32215, 7.57748, 
7.73747, 7.99859, 8.17456, 8.38378, 8.5736), veteran4 = c(4, 
4.26087, 4.68571, 5.02174, 5.33775, 5.67509, 5.93436, 6.23457, 
6.51709, 6.74222, 6.91905, 7.03061, 7.23429, 7.25949, 7.45695, 
7.55906), nonvet5 = c(5, 5.67609, 6.67925, 7.4838, 8.00893, 8.40381, 
8.7619, 8.94483, 9.11293, 9.44026, 9.64865, 9.82846, 10.04, 10.1802, 
10.41, 10.5725), veteran5 = c(5, 5.36136, 6.17668, 6.87269, 7.50219, 
7.87793, 8.09273, 8.32782, 8.66978, 8.8194, 9.02564, 9.16807, 
9.13953, 9.20833, 9.42857, 9.49324), nonvet7 = c(7, 8.12092, 
9.56262, 10.3209, 10.7328, 10.9972, 11.1983, 11.3456, 11.4589, 
11.5897, 11.7032, 11.8473, 11.9051, 11.9662, 12.052, 12.1492), 
    veteran7 = c(7, 7.5086, 8.55455, 9.18089, 9.57778, 9.81452, 
    10.0961, 10.191, 10.2159, 10.3484, 10.4745, 10.5081, 10.5917, 
    10.6735, 10.75, 10.9178), nonvet9 = c(9, 9.82358, 10.6805, 
    11.1595, 11.4332, 11.6324, 11.7545, 11.9122, 11.9673, 12.0211, 
    12.0745, 12.1545, 12.1755, 12.2169, 12.2305, 12.3624), veteran9 = c(9, 
    9.26954, 9.97492, 10.339, 10.6308, 10.7625, 10.9095, 11.1315, 
    11.2128, 11.3333, 11.3038, 11.3826, 11.4692, 11.569, 11.5278, 
    11.5049)), .Names = c("yos", "nonvet4", "veteran4", "nonvet5", 
"veteran5", "nonvet7", "veteran7", "nonvet9", "veteran9"), class = "data.frame", row.names = c(NA, 
-16L))


attach( dat1 )

par( oma = c( 2, 2, 4, 0 ) )

par(mfrow=c(2,2))


plot( yos, nonvet7, type="b", pch=1, cex=1.8, main="Grade 7", xlab="", ylab="", cex.main=1.5 )
points( yos, veteran7, type="b", pch=19, cex=1.8 )

points( 8, 8.5, pch=1, cex=1.8 )
text( 8.5, 8.5, "Nonveterans", pos=4 )
points( 8, 7.95, pch=19, cex=1.8 )
text( 8.5, 7.95, "Veterans", pos=4 )


plot( yos, nonvet9, type="b", pch=1, cex=1.8, main="Grade 9", xlab="", ylab="", cex.main=1.5 )
points( yos, veteran9, type="b", pch=19, cex=1.8 )

points( 8, 10, pch=1, cex=1.8 )
text( 8.5, 10, "Nonveterans", pos=4 )
points( 8, 9.65, pch=19, cex=1.8 )
text( 8.5, 9.65, "Veterans", pos=4 )



plot( yos, nonvet4, type="b", pch=1, cex=1.8, main="Grade 4", xlab="", ylab="", cex.main=1.5 )
points( yos, veteran4, type="b", pch=19, cex=1.8 )

points( 8, 5.3, pch=1, cex=1.8 )
text( 8.5, 5.3, "Nonveterans", pos=4 )
points( 8, 4.8, pch=19, cex=1.8 )
text( 8.5, 4.8, "Veterans", pos=4 )


plot( yos, nonvet5, type="b", pch=1, cex=1.8, main="Grade 5", xlab="", ylab="", cex.main=1.5 )
points( yos, veteran5, type="b", pch=19, cex=1.8 )

points( 7.5, 6.8, pch=1, cex=1.8 )
text( 8, 6.8, "Nonveterans", pos=4 )
points( 7.5, 6.15, pch=19, cex=1.8 )
text( 8, 6.15, "Veterans", pos=4 )


mtext( "Figure 2. Career Progression by Entry Grade", outer = TRUE, cex=2 )
mtext( "Years of Federal Civilian Service", outer = TRUE, cex=1.5, side = 1 )
mtext( "Mean Grade Level", outer = TRUE, cex=1.5, side = 2 )