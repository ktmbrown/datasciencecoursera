library(kernlab)
data(spam)

# perform the subsampling (coin flip)
set.seed(3435)
trainIndicator <- rbinom(4601, size = 1, prob=0.5)
table(trainIndicator)

trainSpam <- spam[trainIndicator==1,]
testSpam <- spam[trainIndicator==0,]

#Look at summaries of data
names(trainSpam)
head(trainSpam)
table(trainSpam$type)

# look at plots
plot(trainSpam$capitalAve ~ trainSpam$type)
plot(log10(trainSpam$capitalAve + 1) ~ trainSpam$type)
plot(log10(trainSpam[, 1:4]+1))

# exploratory analysis
hCluster <- hclust(dist(t(trainSpam[,1:57])))
plot(hCluster)

# redo cluster after transformation
hClusterUpdated <- hclust(dist(t(log10(trainSpam[,1:55] + 1))))
plot(hClusterUpdated)

# statistical model
# which of the variables has the minimum cross-validated error rate
trainSpam$numType <- as.numeric(trainSpam$type) - 1
costFunction = function(x,y) sum(x != (y > 0.5))
cvError = rep(NA, 55)
library(boot)
for (i in 1:55) {
      lmFormula <- reformulate(names(trainSpam)[i], response = 'numType')
      glmFit <- glm(lmFormula, family = "binomial", data = trainSpam)
      cvError[i] <- cv.glm(trainSpam, glmFit, costFunction, 2)$delta[2]
}
names(trainSpam)[which.min(cvError)]

# predict
predictionModel <- glm(numType ~ charDollar, family = "binomial", data = trainSpam)

# get predictions on the test set
predictionTest = predict(predictionModel, testSpam)
predictedSpam = rep("nonspam", dim(testSpam)[1])

predictedSpam[predictionModel$fitted > 0.5] = "spam"

# Classification
table(predictedSpam, testSpam$type)

# Error rate
(61 + 458) / (1346 + 449 + 61 + 458)

