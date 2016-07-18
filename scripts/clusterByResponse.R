clusterByResponse <- function(dataSet, numClusters, responseVariable){
  
  # extract the responseVariable from the total dataSet
  response <- dataSet[ , responseVariable]
  
  # perform kMeans clustering on response data.  Number of clusers generated = numClusters
  response.kmeans <- kmeans(response, centers = numClusters)
  
  # add cluster identity to dataSet
  dataSet$cluster <- response.kmeans$cluster
  
  return(dataSet)
  
}


