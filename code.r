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


require(igraph)
# Ten species
species <- 1:10
network <- graph.empty() + vertices(species)

# Link between species 5 and 7
network[5,7] <- 1

network <- as.directed(random.graph.game(10, .3), mode = 'arbitrary')


# number of species
S <- vcount(network)

# number of interactions
L <- ecount(network)

# average number of interactions species
L.S <- L/S

# food web connectance
C <- L/S^2

plot(network)

# Convert Benguela adjacency matrix to an igraph network
benguela.network <- graph.adjacency(benguela.AM)

# Plot the Benguela food web
plot(benguela.network, edge.arrow.size = 0.2)

# Calculate connectance
connectance <- ecount(benguela.network) / vcount(benguela.network)^2 

# Print connectance va
print(paste0('Connectance of Benguela network =', round(connectance,2)))

# Calculate number of links per species
links.per.species <- ecount(benguela.network) / vcount(benguela.network)


# Calculate conectance of anemoref
bipartite.connectance <- sum(anemonef) / (dim(anemonef)[1] * dim(anemonef)[2])































require(cheddar)
data(Benguela)

require(igraph)
g <- graph_from_adjacency_matrix(PredationMatrix(Benguela))
write.graph(g, file='benguela.edgelist', format='edgelist')

write.table(PredationMatrix(Benguela), file = 'benguela.adjmat')



