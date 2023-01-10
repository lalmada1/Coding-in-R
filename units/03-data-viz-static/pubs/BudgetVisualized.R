
library( networkD3 )
library( dplyr )

source = funding agency
targe = recipient agency
value = total given

funder <- sample( LETTERS[1:5], 100, T )
agency <- sample( LETTERS[6:11], 100, T )
grant <- rnorm( 100, 1000, 10 )

# this is the data summarized, but not how we need it:
tapply( X=grant, INDEX=list( funder, agency ), FUN=sum, na.rm=T )

# try this
id <- paste( funder, "---", agency, sep="" )

tapply( grant, id, sum, na.rm=T )



tt <- tapply( grant, id, sum, na.rm=T )

as.data.frame( tt )

mat <- matrix( unlist( strsplit( row.names(tt), "---" ) ), ncol=2, byrow=T )

from.to <- as.data.frame( mat, stringsAsFactors=F )

names( from.to ) <- c("funder","agency")

dat <- cbind( from.to, value=as.character(round(tt,0)) )

dat$value <- as.numeric( as.character( dat$value ) )

# dat$value <- dat$value / 1000

names( dat ) <- c("source","target","value")

dat



# The function used to create the plots
sanktify <- function(x) {

  # Create nodes DF with the unique sources & targets from input

  nodes <- data.frame(unique(c(x$source,x$target)),stringsAsFactors=FALSE)

  nodes$ID <- as.numeric(rownames(nodes)) - 1 # sankeyNetwork requires IDs to be zero-indexed
  names(nodes) <- c("name", "ID")

  # use dplyr join over merge since much better; in this case not big enough to matter
  # Replace source & target in links DF with IDs
  links <- inner_join(x, nodes, by = c("source"="name")) %>%
    rename(source_ID = ID) %>%
    inner_join(nodes, by = c("target"="name")) %>%
    rename(target_ID = ID) 

  # Create Sankey Plot
  sank <- sankeyNetwork(
    Links = links,
    Nodes = nodes,
    Source = "source_ID",
    Target = "target_ID",
    Value = "value",
    NodeID = "name",
    units = "USD",
    fontSize = 12,
    nodeWidth = 30
  )

  return(sank)

}

sanktify( dat )





