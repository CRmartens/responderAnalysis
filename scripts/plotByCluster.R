plotByCluster <- function(dataSet, plotVariable){
  
  # extract the plotVariable from the total dataSet 
  # Note: plotVariable does not need to be the same as "responseVariable"
  # plot variable must be numeric (e.g., cannot be "Sex" or "Group")
  
  plotVariable <- as.matrix(dataSet[ , plotVariable])
  
  # determine number of clusters in dataSet.  Must have at least 1 cluster.
  numClusters <- length(unique(dataSet$cluster))
  
  plot(plotVariable[dataSet$cluster == 1, ], col = 1,
    xlim = c(min(plotVariable[, 1]), max(plotVariable[, 1])),
    ylim = c(min(plotVariable[, 1]), max(plotVariable[, 1])), ylab = c("deltaFMD"), main = c("FMD Responsiveness to Exercise"))

  if (numClusters > 1){
    # set counter variable to count all clusters after the first cluster and assign colors
    i = 2
    
    # plot any additional clusters
    for(i in i:numClusters){
      points(plotVariable[dataSet$cluster == i], col = i)
    }
    
  }
  
}
