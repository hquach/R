##### Chapter 3: Classification using Nearest Neighbors --------------------

## Example: Classifying Cancer Samples ----
## Step 2: Exploring and preparing the data ---- 

# import the data file
donor <- read.table("transfusion.data", stringsAsFactors = FALSE, sep=",", header=TRUE)

# examine the structure of the blood donor data frame
str(donor)

# drop the id feature
#bank <- bank[-1]

# table of whether.he.she.donated.blood.in.March.2007
table(donor$whether.he.she.donated.blood.in.March.2007)

# recode whether.he.she.donated.blood.in.March.2007 as a factor
donor$whether.he.she.donated.blood.in.March.2007 <- factor(donor$whether.he.she.donated.blood.in.March.2007, levels = c("0", "1"),
                         labels = c("No", "Yes"))

# table or proportions with more informative labels
round(prop.table(table(donor$whether.he.she.donated.blood.in.March.2007)) * 100, digits = 1)

# summarize four numeric features
summary(donor[c("Recency..months.", "Frequency..times.", "Monetary..c.c..blood.", "Time..months.")])

# create normalization function
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

# test normalization function - result should be identical
normalize(c(1, 2, 3, 4, 5))
normalize(c(10, 20, 30, 40, 50))

# normalize the donor data
donor_n <- as.data.frame(lapply(donor[1:4], normalize))

# confirm that normalization worked for Recency
summary(donor_n$Recency..months.)

# create training and test data
donor_train <- donor_n[1:648, ]
donor_test <- donor_n[649:748, ]

# create labels for training and test data
donor_train_labels <- donor[1:648, 5]
donor_test_labels <- donor[649:748, 5]

## Step 3: Training a model on the data ----

# load the "class" library
library(class)

donor_test_pred <- knn(train = donor_train, test = donor_test, cl = donor_train_labels, k = 27)

## Step 4: Evaluating model performance ----

# load the "gmodels" library
library(gmodels)

# Create the cross tabulation of predicted vs. actual
CrossTable(x = donor_test_labels, y = donor_test_pred,
           prop.chisq = FALSE)

## Step 5: Improving model performance ----

# use the scale() function to z-score standardize a data frame
donor_z <- as.data.frame(scale(donor[-5]))

# confirm that the transformation was applied correctly
summary(donor_z$Recency..months.)

# create training and test datasets
donor_train <- donor_z[1:648, ]
donor_test <- donor_z[649:748, ]

# re-classify test cases
donor_test_pred <- knn(train = donor_train, test = donor_test,
                      cl = donor_train_labels, k = 3)

# Create the cross tabulation of predicted vs. actual
CrossTable(x = donor_test_labels, y = donor_test_pred,
           prop.chisq = FALSE)

# create training and test datasets
donor_train <- donor_z[1:648, ]
donor_test <- donor_z[649:748, ]

donor_test_pred <- knn(train = donor_train, test = donor_test, cl = donor_train_labels, k=3)
CrossTable(x = donor_test_labels, y = donor_test_pred, prop.chisq=FALSE)

# create training and test datasets
donor_train <- donor_z[1:648, ]
donor_test <- donor_z[649:748, ]

donor_test_pred <- knn(train = donor_train, test = donor_test, cl = donor_train_labels, k=5)
CrossTable(x = donor_test_labels, y = donor_test_pred, prop.chisq=FALSE)

# create training and test datasets
donor_train <- donor_z[1:648, ]
donor_test <- donor_z[649:748, ]

donor_test_pred <- knn(train = donor_train, test = donor_test, cl = donor_train_labels, k=7)
CrossTable(x = donor_test_labels, y = donor_test_pred, prop.chisq=FALSE)

# create training and test datasets
donor_train <- donor_z[1:648, ]
donor_test <- donor_z[649:748, ]

donor_test_pred <- knn(train = donor_train, test = donor_test, cl = donor_train_labels, k=9)
CrossTable(x = donor_test_labels, y = donor_test_pred, prop.chisq=FALSE)

# create training and test datasets
donor_train <- donor_z[1:648, ]
donor_test <- donor_z[649:748, ]

donor_test_pred <- knn(train = donor_train, test = donor_test, cl = donor_train_labels, k=11)
CrossTable(x = donor_test_labels, y = donor_test_pred, prop.chisq=FALSE)

# create training and test datasets
donor_train <- donor_z[1:648, ]
donor_test <- donor_z[649:748, ]

donor_test_pred <- knn(train = donor_train, test = donor_test, cl = donor_train_labels, k=13)
CrossTable(x = donor_test_labels, y = donor_test_pred, prop.chisq=FALSE)

# create training and test datasets
donor_train <- donor_z[1:648, ]
donor_test <- donor_z[649:748, ]

donor_test_pred <- knn(train = donor_train, test = donor_test, cl = donor_train_labels, k=15)
CrossTable(x = donor_test_labels, y = donor_test_pred, prop.chisq=FALSE)

# create training and test datasets
donor_train <- donor_z[1:648, ]
donor_test <- donor_z[649:748, ]

donor_test_pred <- knn(train = donor_train, test = donor_test, cl = donor_train_labels, k=17)
CrossTable(x = donor_test_labels, y = donor_test_pred, prop.chisq=FALSE)

# create training and test datasets
donor_train <- donor_z[1:648, ]
donor_test <- donor_z[649:748, ]

donor_test_pred <- knn(train = donor_train, test = donor_test, cl = donor_train_labels, k=21)
CrossTable(x = donor_test_labels, y = donor_test_pred, prop.chisq=FALSE)

