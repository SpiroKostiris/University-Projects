The elbow method is used to determine the optimal number of clusters in k-means clustering.

The elbow method plots the value of the cost function produced by different values of k. As you know, if k increases, 
average distortion will decrease, each cluster will have fewer constituent instances, and the instances will be 
closer to their respective centroids. However, the improvements in average distortion will decline as k increases.
 
The value of k at which improvement in distortion declines the most is called the elbow, at which we should stop 
dividing the data into further clusters.

We’ll then display the categorized data using the optimum number of clusters we determined in the elbow method step. 
