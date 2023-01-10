
library( dplyr )
library( scales )


d <- read.csv( "https://data.tempe.gov/dataset/7556b322-1b7d-4f65-87b8-598d11ef50fb/resource/6e542152-245b-4773-ba10-dc3223177e3b/download/crashdatareport.csv" )

URL <- "https://data.tempe.gov/dataset/7556b322-1b7d-4f65-87b8-598d11ef50fb/resource/6e542152-245b-4773-ba10-dc3223177e3b/download/crashdatareport.csv"

d <- read.csv( URL, stringsAsFactors=F )

d <- filter( d, Latitude > 33.3 )

plot( d$Longitude, d$Latitude, pch=20, cex=0.3 )

color <- ifelse( d$Totalinjuries > 0, "red", "gray" )
color <- alpha( color, alpha=0.05 )
my.cex <- ifelse( d$Totalinjuries > 0, 0.6, 0.3 )

plot( d$Longitude, d$Latitude, pch=20, col=color, cex=1 )

color <- ifelse( d$Totalinjuries > 0, "red", NA )
color <- alpha( color, alpha=0.05 )
plot( d$Longitude, d$Latitude, pch=20, col=color, cex=1 )


### Identify locations with multiple crashes

d$coords <- paste( d$Latitude, d$Longitude, sep="x" )
table( table( coords ) )

d <- add_count( d, coords )
d2 <- filter( d, n > 2 )
plot( d2$Longitude, d2$Latitude, pch=20, col=gray(0.5,0.01), cex=3 )




### DEMOGRAPHIC ANALYSIS


head( d )

d$Age_Drv2[ d$Age_Drv2 > 100 | d$Age_Drv2 < 14 ] <- NA
hist( d$Age_Drv2, breaks=90, col="gray", border="white" )

sum( d$Totalinjuries > 0 )

sum( d$Totalfatalities > 0 )


age <- cut( d$Age_Drv1, breaks=seq(10,100,10), paste0( seq(10,90,10), "-", seq(21,101,10) ) )

prop.table( table( age, d$Collisionmanner ), margin=1 ) %>% round(2)

prop.table( table( age, d$Lightcondition ), margin=1 ) %>% round(2)

prop.table( table( age, d$Violation1_Drv1 ), margin=1 ) %>% round(2)

prop.table( table( d$Gender_Drv1, d$Gender_Drv2 ) ) %>% round()

saveRDS( d, "TempeTrafficAccidents.rds" )
write.csv( d, "TempeTrafficAccidents.csv", row.names=F )


# create a grid, count accidents using loops 
# first loop just slice map by longitude






#### DASHBOARD

Filters

- day of week (check boxes)
- hour of day (slider)
- month of year (check boxes)

- severity (no injury, injury, fatality)
- involve alcohol (driver 1, drive 2)

Analysis:

- map (size=number hurt, col=injuries/fatalities)
- barplot type of accident
- histogram age of driver


Animation - accidents by time of day

Injuries by time of day
Injuries by day of week
Injuries by age groups
Injuries by 



####################   EXRACT DATES AND TIMES


path <- "C:/Users/jdlecy/Dropbox/02 - CLASSES/03 - PEDA/Data-Science-Class/DATA"

normalizePath( path )

setwd( normalizePath( path ) )

dir()


d <- readRDS( "TempeTrafficAccidents.rds" )

d$DateTime <- as.character( d$DateTime )
vec <- as.Date( d$DateTime, format="%m/%d/%y %H:%M" )

vec <- strptime( d$DateTime, format="%m/%d/%y %H:%M" )


head( vec )


vec <- as.Date( d$DateTime )



format( head( vec ), format="%H" )  # hour of day 0-23
 
format( head( vec ), format="%m" )  # month 1-12

format( head( vec ), format="%b" )  # abbreviated month Jan, Feb, etc

format( head( vec ), format="%A" )  # day of the week Monday, Tuesday, etc.

format( head( vec ), format="%a" )  # abbreviated day of the week Mon, Tue, etc.






strsplit( head(d$DateTime), split="///" )



times <- strSplit( head(d$DateTime), split="//" )



these <- strsplit( d$DateTime, split="\\/|:|[[:space:]]" )
table( sapply( these, length ) ) # all are same length

rename.x <- function(x)
{ 
  names(x) <- c("month","day","year","hour","minute")
  return(x) 
}

these3 <- lapply( these, rename.x )
df <- do.call( rbind, these3 )
df <- as.data.frame(df)

table( df$month )
table( df$hour )

barplot( table( factor(df$hour, levels=23:0) ), horiz=T, las=1 )

barplot( table( factor(df$month, levels=12:1) ), horiz=T, las=1 )



as.Date( dat$Violation.Date, format="%m/%d/%Y" )






d <- cbind( d, df )

d$hour <- factor( d$hour, levels=0:23 )

t1 <- table( d$Injuryseverity, d$hour )

barplot( t1, beside=F , col=c("red","orange","white","gray","gray") )

d$weekday <- format( vec, format="%a" )
d$weekday <- factor( d$weekday, levels=c("Mon","Tue","Wed","Thu","Fri","Sat","Sun") )

d2 <- filter( d, Injuryseverity == "Fatal" )
barplot( table(d2$hour ) )
barplot( table(d2$weekday ) )

table( d2$hour, d2$weekday )

dd <- count( d2, hour, weekday )

plot( as.numeric(dd$weekday), as.numeric(dd$hour), cex=dd$n, pch=19 )



d3 <- filter( d, Injuryseverity %in% c("Fatal","Incapacitating Injury") )
barplot( table(d3$hour ) )


d4 <- filter( d, Injuryseverity == "Incapacitating Injury" )
barplot( table(d4$hour ) )

















###################


library( ggmap )
library( dplyr )

dat <- readRDS( "C:/Users/jdlecy/Dropbox/02 - CLASSES/03 - PEDA/Data-Science-Class/DATA/TempeTrafficAccidents.rds" )
d2 <- 
  dat %>% 
  filter( Totalinjuries > 0 | Totalfatalities > 0 ) %>%
  mutate( tot.injuries.fatalities = Totalinjuries + Totalfatalities )

# summary( d2$tot.injuries.fatalities )

par( mar=c(0,0,4,0) )
plot( d2$Longitude, d2$Latitude, pch=19, 
      cex=0.25*d2$tot.injuries.fatalities, 
      col=alpha( "firebrick", alpha=0.5),
      main="Traffic Accidents in Tempe, AZ",
      xlab="", ylab="",
      bty="n", axes=F )

title( main="(plot size relative to injuries and fatalities)", 
       line=-0.3, cex.main=0.7 )




d2$fatal <- ifelse( d2$Totalfatalities > 0, "firebrick", "gray" )
par( mar=c(0,0,4,0) )
plot( d2$Longitude, d2$Latitude, pch=19, 
      cex=0.25*d2$tot.injuries.fatalities, 
      col=alpha( d2$fatal, alpha=0.5),
      main="Traffic Accidents in Tempe, AZ",
      xlab="", ylab="",
      bty="n", axes=F )

title( main="(plot size relative to injuries and fatalities)", 
       line=-0.3, cex.main=0.7 )




map <- get_map( location="tempe az" )
ggmap( map )


us <- c(left = -125, bottom = 25.75, right = -67, top = 49)
map <- get_stamenmap( "tempe az", zoom = 5, maptype = "toner-lite")
ggmap(map)


qmplot( lon, lat, data = violent_crimes, maptype = "toner-lite", color = I("red"))


point.size <- 0.75*d2$tot.injuries.fatalities

qmplot( Longitude, Latitude, data=d2, maptype="toner-lite", zoom=14, 
        size=I(point.size), color=I("red"), alpha = I(0.1) ) + facet_wrap( ~ Collisionmanner ) ,
        xlim=c( -111.9515, -111.9051), ylim=c(33.38434, 33.44176) )


qmplot( Longitude, Latitude, data=d2, maptype="toner-lite", zoom=13, geom="density2d", 
        color=I("red") ) 

qmplot( Longitude, Latitude, data=d2, maptype="toner-lite", zoom=13, geom="density2d", 
        color=I("red") ) 

qmplot( Longitude, Latitude, data=d2, geom = "blank", 
  zoom = 13, maptype = "toner-background", darken = .7, legend = "topleft" ) +
  stat_density_2d( aes(fill = ..level..), geom = "polygon", alpha=0.3 ) , color = NA) +
  scale_fill_gradient2( "Deaths &\nFatalities", low = "white", mid = "yellow", high = "red", midpoint = 200 )



qmplot( Longitude, Latitude, data=d2, geom = "blank", 
  zoom = 13, maptype = "toner-background", darken = .7, legend = "topleft" ) +
  stat_density_2d( aes(fill = ..level..), geom = "polygon", alpha=0.3, color = NA) +
  scale_fill_gradient2( low="white", mid="yellow", high="red" ) + 
  facet_wrap( ~ AlcoholUse_Drv2 )



d2$Unittype_One <- recode( d2$Unittype_One, Pedalcyclist="Ped", Pedestrian="Ped", Driver="Driver", .default = NA_character_ )


d2$type <- d2$Unittype_One %in% c("Pedalcyclist","Pedestrian") | d2$Unittype_Two %in% c("Pedalcyclist","Pedestrian")

qmplot( Longitude, Latitude, data=d2, geom = "blank", 
  zoom = 13, maptype = "toner-background", darken = .7, legend = "topleft" ) +
  stat_density_2d( aes(fill = ..level..), geom = "polygon", alpha=0.3, color = NA) +
  scale_fill_gradient2( low="white", mid="yellow", high="red" ) + 
  facet_wrap( ~ type )



table( d2$Collisionmanner )


d3 <- 
  d2 %>% 
  group_by( Collisionmanner ) %>%
  filter(n() > 500 ) %>%
  ungroup()


qmplot( Longitude, Latitude, data=d3, geom = "blank", 
  zoom = 13, maptype = "toner-background", darken = .7, legend = "topleft" ) +
  stat_density_2d( aes(fill = ..level..), geom = "polygon", alpha=0.3, color = NA) +
  scale_fill_gradient2( low="white", mid="yellow", high="red", midpoint=250 ) + 
  facet_wrap( ~ Collisionmanner )


d2$young <- d2$Age_Drv1 < 30
d2$old <- d2$Age_Drv1 > 60

d2$age.group <- cut( d2$Age_Drv1, breaks=c(0,25,45,65,150) )

d2$fatal <- d2$Totalfatalities > 0 

qmplot( Longitude, Latitude, data=d2, geom = "blank", 
  zoom = 13, maptype = "toner-background", darken = .7, legend = "topleft" ) +
  stat_density_2d( aes(fill = ..level..), geom = "polygon", alpha=0.3, color = NA) +
  scale_fill_gradient2( low="white", mid="yellow", high="red", midpoint=100 ) + 
  facet_wrap( ~ fatal )



d2$fatal <- d2$Totalinjuries > 2 

qmplot( Longitude, Latitude, data=d2, geom = "blank", 
  zoom = 13, maptype = "toner-background", darken = .7, legend = "topleft" ) +
  stat_density_2d( aes(fill = ..level..), geom = "polygon", alpha=0.3, color = NA) +
  scale_fill_gradient2( low="white", mid="yellow", high="red", midpoint=100 ) + 
  facet_wrap( ~ fatal )



vec <- as.Date( d2$DateTime, format="%m/%d/%y %H:%M" )

d2$DateTime <- as.character( d2$DateTime )
vec <- as.Date( d2$DateTime, format="%m/%d/%y %H:%M" )


d2$DateTime <- as.character( d2$DateTime )
vec <- strptime( d2$DateTime, format="%m/%d/%y %H:%M" )

head( vec )



format( head( vec ), format="%H" )  # hour of day 0-23
 
format( head( vec ), format="%m" )  # month 1-12

format( head( vec ), format="%b" )  # abbreviated month Jan, Feb, etc

format( head( vec ), format="%A" )  # day of the week Monday, Tuesday, etc.

format( head( vec ), format="%a" )  # abbreviated day of the week Mon, Tue, etc.

d2$day <- format( vec, format="%a" )


d2$hour <- format( vec, format="%H" )  # hour of day 0-23

level.order <- c("00", "01", "02", "03", "04", "05", "06", "07", "08", "09", 
"10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", 
"21", "22", "23")

d2$hour <- factor( d2$hour, levels=level.order )


d2$weekday <- format( vec, format="%a" )
d2$weekday <- factor( d2$weekday, levels=c("Mon","Tue","Wed","Thu","Fri","Sat","Sun") )


d4 <- filter( d2, type==FALSE )

qmplot( Longitude, Latitude, data=d4, geom = "blank", 
  zoom = 13, maptype = "toner-background", darken = .3, legend = "topleft" ) +
  stat_density_2d( aes(fill = ..level..), geom = "polygon", alpha=0.4, color = NA ) +
  scale_fill_viridis() +
  facet_wrap( ~ hour, ncol=6, nrow=4 )

library( viridis )




