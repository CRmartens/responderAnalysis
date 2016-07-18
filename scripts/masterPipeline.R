source('~/Documents/projects/responderAnalysis/scripts/clusterByResponse.R')
source('~/Documents/projects/responderAnalysis/scripts/plotByCluster.R')

# read data file
dat <- read.csv("./data/COMBINEDDATA.csv", row.names = 1, header = TRUE)

responseVar <- "deltaFMD"

# perform K-means clustering
dat <- clusterByResponse(dataSet = dat, numClusters = 2, responseVariable = responseVar)

# plot by cluster
plotByCluster(dat, responseVar)

# plot variable of interest by cluster Group
numClusters <- length(unique(dat$cluster))
clusterMeans <- rep(NA, numClusters)

for(i in 1:numClusters){
  datByCluster <- subset(dat, dat$cluster == i)
  clusterMeans[i] <- mean(datByCluster[ , responseVar])
}

barplot(clusterMeans, col = c("blue", "red"), 
        ylab = responseVar, 
        names.arg = c("Responders", "Non-Responders"), 
        main = responseVar)

# predict cluster group using regression

# proof-of-concept: the response variable is very good at picking the cluster assignment
model1 <- lm(cluster ~ dat[, responseVar], data = dat)
summary(model1)

# Sex is not good at predicting (the non-responders are evenly matched for Males and Females)
model2 <- lm(cluster ~ SEX, data = dat)
summary(model2)







