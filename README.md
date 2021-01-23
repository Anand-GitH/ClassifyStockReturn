# ClassifyStockReturn
Weekly S&amp;P Stock Market Data to classify as Down(Negative Return) or Up(Positive Return)  


Dataset: Weekly
Weekly S&P Stock Market Data
Class: Down – Negative return
Up – Positive return
9 variables and 1089 observations

Logistic Regression: It uses linear regression + sigmoid function to classify the data. As
sigmoid function returns values from 0 to 1 and values <=0.5 is classified as one class and
values>0.5 is classified as other class its binary classification.

LDA: Linear discriminant analysis – a true decision boundary discovery algorithm which is
applied Gaussian data it assumes the class has common covariance and its decision
boundary is linear separating the classes.

k-NN: Nearest Neighbor algorithm where k represents numbers of neighbors to be
considered to classify the given data point to the closest class out of k neighbors using
distance as a metric.

Conclusion:

If data follows Gaussian distribution its better to use LDA as it separates the classes by drawing
the linear decision boundary using the mean and common variance between classes whereas k-
NN which uses distance metric and Logistic which uses sigmoid function and it has limitation of
binary class which might have higher misclassification rate.

LDA has better accuracy rate compared to other classification methods for the given dataset
