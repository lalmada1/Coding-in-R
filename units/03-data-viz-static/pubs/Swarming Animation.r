# Spatial Critter Swarming Simulation

# This is a simulation in which I attempt to see if I can simulate herding behavior.

# Critters are initially distributed randomly on a 1 x 1 grid.

ncritters = 40

xypos = matrix(runif(ncritters*2),ncol=2)
plot(xypos, main="Critters are Initially Distributed Randomly"
          , xlab="X", ylab="Y")

# Now let's imagine that each critter has an ideal safe distance from each other critter.

safe.dist = .3

critter.speed = .001

# If another critter is not at that safe distance than the critter will move towards the closest nearby critter.

# Let's see how this works.

# First let's check how close each critter is to each other critter.
# We will accomplish this by going through each critter and checking how far away each other critter is.
distances = NULL
for (i in 1:ncritters) distances = rbind(distances, apply((xypos[i,]-t(xypos))^2,2,sum))

# In order to prevent critters from always chasing whatever is closest to them (and themselves) we drop anything which is closer than the safe.distance.
distances[abs(distances)<safe.dist]=NA
closest =  matrix(1:ncritters, ncol=ncritters, nrow=ncritters)[apply(abs(distances), 1, order)[1,]]
  # The apply command will apply the order command to each row whiel the [1,] selects only the critter that is closes.

# Plot the 
plot(xypos, xlab = "X", ylab = "Y")
for (i in 1:ncritters) arrows(x0=xypos[i,1], y0=xypos[i,2],
                              x1=xypos[closest,][i,1], 
                              y1=xypos[closest,][i,2], 
                              length=.1)  

# This calculates the difference between the current position of each critter and that of the closest critter.
ab = xypos-xypos[closest,]

# Now calculate the difference in the horizontal and vertical axes that the critters will move as a projection into the direction of the closest critter outside of the safe zone.
a.prime = critter.speed/(1 + (ab[,2]^2)/(ab[,1]^2))^.5
b.prime = (critter.speed^2-a.prime^2)^.5

# This corrects the movement to ensure that the critters are flying at each other rather than away from each other.
movement = cbind(a.prime * sign(ab[,2]), b.prime * sign(ab[,1]))
between = function(xy1,xy2,point) (point>xy1&point<xy2)|(point>xy2&point<xy1)
movement = movement*(-1)^between(xypos,xypos[closest,], xypos-movement)

# Set the new xypos
xypos1 = xypos+movement

points(xypos1, col="red")

# ------------------------------------------------------
# Let's turn this into an animation.

library(animation)

# loopnum = 100; ncritters=40; inertia = .5; show.grid=T; ani.pause=F; plot.fixed=F; plot.centered=F; brownian = F; arrow = T
flocking <- function(loopnum = 100, ncritters=40, inertia = .5, show.grid=T, ani.pause=F, plot.fixed=F, plot.centered=F, brownian = F, arrow = T) {

  # Generate xy initial positions.
  # xypos will hold the current critter position while
  # xypos0 will hold the position of the critters the previous time.
  xypos = xypos0 = matrix(runif(ncritters*2),ncol=2)-.5

  movement0 = 0

  # Loop though all of the loops.
  for (i in 1:loopnum) {

  # This specifies the range to be graphed.
  if (plot.fixed) rangex=rangey = -.5:.5
  if (!plot.fixed) {
    rangex = c(min(xypos[,1]), max(xypos[,1]))
    rangey = c(min(xypos[,2]), max(xypos[,2]))
  }
  
  #  This handles the grid size when 
  if (plot.centered&!plot.fixed) {
    rangex=c(-max(abs(xypos[,1])), max(abs(xypos[,1])))
    rangey=c(-max(abs(xypos[,2])), max(abs(xypos[,2])))
  }

  # This centers the plot at the middle (0,0) if the plot width is also set to be fixed.
  if (plot.centered&plot.fixed) rangex=rangex-mean(rangex)
  if (plot.centered&plot.fixed) rangey=rangey-mean(rangey)

  # Draw critters
  plot(xypos, main="Swarming Animation", xlab="X", ylab="Y", axes=F, ylim=rangey, xlim=rangex, type="p")
  # Draw arrows.  The start of the arrows is the previous periods location.
  if (arrow&i>1) arrows(x0=xypos0[,1],y0=xypos0[,2],x1=xypos[,1],y1=xypos[,2], length = .1)
  
  # Show the grid in the background.
  if (show.grid) {
    abline(v=seq(-10,10,.1))
    abline(h=seq(-10,10,.1))
  }
  
  # Show the origin
  text(0,0, "(0,0)")
  
  # Calculate each critters distance from each other
  distances = NULL
  for (i in 1:ncritters) distances = rbind(distances, apply((xypos[i,]-t(xypos))^2,2,sum))

  # Drop those within the safe zone.
  distances[abs(distances)<safe.dist]=NA
  
  # This selects the critter closest to the selected critter.
  closest =  matrix(1:ncritters, ncol=ncritters, nrow=ncritters)[apply(abs(distances), 1, order)[1,]]

#   distances[as.apply(!apply(distances, 1, is.na),1,sum)==0,]=0
 
  # As done above
  ab = xypos-xypos[closest,]

  a.prime = critter.speed/(1 + (ab[,2]^2)/(ab[,1]^2))^.5
  b.prime = (critter.speed^2-a.prime^2)^.5

  movement = cbind(a.prime * sign(ab[,2]), b.prime * sign(ab[,1]))

  between = function(xy1,xy2,point) (point>xy1&point<xy2)|(point>xy2&point<xy1)

  movement = movement*(-1)^between(xypos,xypos[closest,], xypos-movement)

  movement[is.na(movement)]=0
  
  movement0 = movement0*inertia + movement
  
  # This fancy dodad allows half of the change in movement to be due to random variation.
  if (brownian) movement0=movement0+matrix(rnorm(ncritters*2),ncol=2)*critter.speed/2
  
  # Set the previous round's xy position to be equal to the current round's.
  xypos0 = xypos

  # Update the current round's.
  xypos = xypos+movement0
  
  # This is only used in the event that the animate package is in use.
  if (ani.pause) ani.pause()
  }

}

# This generates a GIF animation demonstrating smoothly how these GIFs can be incorper
ani.options(ani.width=400, ani.height=400, interval=.1)
saveGIF(flocking(300,100,.999, ani.pause=T), movie.name = "Swarming.gif", replace=T)

# Let's see how this works.
flocking()
flocking(400,100,.99)
flocking(400,100,.99, plot.fixed=T)

safe.dist = .1
critter.speed = .001

flocking(400,100,.999, brownian=T, show.grid=F, plot.centered=T)


