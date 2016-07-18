# responderAnalysis

This package includes a set of functions for identifying responders & nonresponders to intervention studies and for identifying novel biomarkers that predict responsiveness.


Functions Include:

clusterByResponse(dataSet, numClusters, responseVariable)

dataSet: includes the raw data as it is uploaded.  If a response variable (e.g., delta value between two columns) is not present, the user will need to add this column before using the function.

numClusters: specifies the number of clusters the data are to be segmented into

responseVariable: specifies which variable to use to make the clusters

plotByCluster(dataSet, plotVariable)

dataSet: raw data.  Note: This function requires that clusterByResponse has already been run as cluster assignment is needed for plotting

plot Variable: which variable to plot by cluster.  Note: plotByCluster will plot any variable as a function of cluster assignment and is not limited to the variable used to define clusters.  This could be particularly useful for identifying variables that may be associated with cluster assignment (and thus mediate the response variable).



