source('~/Documents/projects/responderAnalysis/scripts/clusterByResponse.R')
source('~/Documents/projects/responderAnalysis/scripts/plotByCluster.R')

# read data file
dat <- read.csv("./data/COMBINEDDATA.csv", row.names = 1, header = TRUE)

# perform K-means clustering
dat <- clusterByResponse(dataSet = dat, numClusters = 2, responseVariable = "deltaFMD")

# plot by cluster
plotByCluster(dat, "deltaFMD")

# plot variable of interest by cluster Group
numClusters <- length(unique(dat$cluster))
clusterMeans <- rep(NA, numClusters)

for(i in 1:numClusters){
  datByCluster <- subset(dat, dat$cluster == i)
  clusterMeans[i] <- mean(datByCluster$deltaFMD)
}

barplot(clusterMeans, col = c("blue", "red"), 
        ylab = "deltaFMD", 
        names.arg = c("Responders", "Non-Responders"), 
        main = "delta FMD")

# predict cluster group using regression

model <- lm(dat$SEX ~ as.factor(dat$cluster == cluster[1]))





