library(RCurl)
x <- getURL("https://raw.githubusercontent.com/seblun/networks_datacamp/master/datasets/benguela.tro")
benguela.EL <- read.table(text = x)
benguela.EL <- as.matrix(benguela.EL)

# Create an adjacency matrix called benguela.AM, containing only zeros
benguela.AM <- matrix(0, max(benguela.EL), max(benguela.EL))

# Introduce ones to the matrix to represent interactions between species
benguela.AM[benguela.EL] <- 1

S <- dim(benguela.AM)[1]

L <- sum(benguela.AM)


#### bipartite networks

library(RCurl)
y <- getURL("https://raw.githubusercontent.com/seblun/networks_datacamp/master/datasets/anemonefish.txt")
anemonef <- read.table(text = y)
names(anemonef) <- paste("A", 1:10, sep = "")
row.names(anemonef) <- paste("F", 1:26, sep = "")
anemonef <- as.matrix(anemonef)


## Install igraph
install.packages("igraph")

## Load igraph into workspace
library(igraph)


srequire(cheddar)
data(Benguela)

require(igraph)
g <- graph_from_adjacency_matrix(PredationMatrix(Benguela))
write.graph(g, file='benguela.edgelist', format='edgelist')

write.table(PredationMatrix(Benguela), file = 'benguela.adjmat')


benguela.EL <- read.table()


