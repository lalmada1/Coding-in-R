setwd( "C:/Users/jdlec/Dropbox (Personal)/04 - GRANTS/16 - PIT-UN 2021/intro-data-science-TEMPLATE/units" )

dir()

topic-04x01-shiny-widgets.pdf

lab-04a-template.rmd

practice-03x01-plot.R


x <- "topic-04x01-shiny-widgets.pdf"


d






parse_asset <- function( x, type )
{
  x <- gsub( "\\.[[:alpha:]]{1,4}$", "", x )
  m <- regexpr( "[[:digit:]]{2}x[[:digit:]]{2}", x )
  s <- regmatches( x, m )
  unit <- substr( s, 1, 2 )
  section <- substr( s, 4, 5 )
  x <- gsub( paste0( type, "-", s, "-" ), "", x )
  x <- gsub( "-", " ", x )
  x <- stringr::str_to_title( x )
  d <- data.frame( type=type, unit, section, title=x )
  return(d)
}



# 1. get all files 

files <- list.files( recursive=T )

# 2. topics 

f.topics <- files[ grepl( "/topic-", files ) ]
m <- regexpr( "topic-", f.topics )
f.topics <- substr( start=m, stop=1000000L, f.topics )
l.topics <- lapply( f.topics, sanitize )
d.topics <- dplyr::bind_rows( l.topics )
d.topics <- unique( d.topics )

# generic 

type="topic"
type="lab"

get_index <- function( files, type="topic" )
{
  f.type <- files[ grepl( paste0( "/", type, "-"), files ) ]
  m <- regexpr( paste0( type, "-"), f.type )
  f.type <- substr( start=m, stop=1000000L, f.type )
  l.type <- lapply( f.type, parse_asset, type )
  d.type <- dplyr::bind_rows( l.type )
  d.type <- unique( d.type )
  return( d.type )
}


get_index( files, type="topic" )
get_index( files, type="practice" )


get_labs <- function( files )
{
  f.labs <- files[ grepl( "lab-[[:digit:]]{2}", files ) ]
  m <- regexpr( "lab-", f.labs )
  f.labs <- substr( start=m, stop=1000000L, f.labs )
  f.labs <- f.labs[ ! grepl( "/", f.labs ) ]  # exclude anything with subdirectory
  l <- lapply( f.labs, parse_labs )
  d <- dplyr::bind_rows( l )
  d <- unique(d)
  return( d )
}

get_labs( files )


parse_labs <- function( x )
{
  file <- 
  # remove file extension 
  x <- gsub( "\\.[[:alpha:]]{3,4}$", "", x )
  m <- regexpr( "lab-[[:digit:]]{2}", x )
  s <- regmatches( x, m )
  unit <- substr( s, 5, 6 )
  if( length(unit) == 0 ){ return(NULL) }
  section <- ""
  x <- gsub( "lab-[[:digit:]]{2}.?-", "", x )
  x <- gsub( "-", " ", x )
  x <- stringr::str_to_title( x )
  x <- paste0( "LAB-", unit, " ", x )
  d <- data.frame( type="lab", unit, section, title=x, location )
  return(d)
}




parse_demo <- function( x )
{
  x <- gsub( "\\.[[:alpha:]]{1,4}$", "", x )
  x <- gsub( "demo-", "", x )
  x <- gsub( "-", " ", x )
  x <- stringr::str_to_title( x )
  d <- data.frame( type="demo", unit="", section="", title=x )
  return(d)
}



get_demos <- function( files )
{
  f.demo <- files[ grepl( "demo-", files ) ]
  m <- regexpr( "demo-", f.demo )
  f.demo <- substr( start=m, stop=1000000L, f.demo )
  l <- lapply( f.demo, parse_demo )
  d <- dplyr::bind_rows( l )
  d <- unique(d)
  return( d )
}


d1 <- get_index( files, type="topic" )
d2 <- get_index( files, type="practice" )
d3 <- get_labs( files )
d4 <- get_demos( files )

d <- rbind( d1, d2, d3, d4 )

d$type <- factor( d$type, levels=c("topic","practice","lab","demo") )

library( dplyr )

d <- d[ c("unit","section","type","title") ]
d$unit[ d$unit == " " ] <- "99"
d$section[ d$section == "" ] <- "--"


d <- 
d %>% 
  arrange( unit, type, section )



x <- strsplit( files, "/" )
x <- sapply( x, "[[", 1 )
x <- x[ grepl( "[[:digit:]]{2}-", x ) ]
x <- unique( x )
head(x)

unit <- substr( x, 1, 2 )

x <- substr( x, 4, 100000L )
x <- gsub( "-", " ", x )
x <- stringr::str_to_title( x )

d.units <- data.frame( unit, unit.name=x)
d.units

d <- merge( d, d.units, all.x=T )


d <- d[ c("unit.name", "unit", "section", "type", "title" ) ]
d







