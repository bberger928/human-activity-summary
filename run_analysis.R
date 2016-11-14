test <- read.table("X_test.txt")
train <- read.table("X_train.txt")
totalRows <- length(train[,1])+length(test[,1])
totalCols <- length(train[1,])

means <- vector(length=totalCols)
deviations <- vector(length=totalCols)

for (i in 1:totalCols) {
	means[i] = mean(c(test[,i],train[,i]))
	deviations[i] = sd(c(test[,i],train[,i]))
}

featureNames <- read.table("features.txt")

library(data.table)

dataSummary = as.data.frame.matrix(data.table(means=means,deviations=deviations))

row.names(dataSummary) <- paste(featureNames[,1],":",featureNames[,2])