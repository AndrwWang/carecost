import matplotlib
matplotlib.use('MacOSX')

import pandas as pd
from sklearn import linear_model

# read the csv file into a matrix
insurance = pd.read_csv("insurance.csv")

# the columns which have non-numerical values
categorical_columns = ['sex', 'smoker', 'region']

# replace categorical columns with equivalent numerical columns
# for example, the smoker column, which had "yes" and "no" values,
# is replaced with a "yes" column and a "no" column with values of 0s and 1s
for column in categorical_columns:
    insurance = pd.concat([insurance, pd.get_dummies(insurance[column])], axis=1)
    insurance.drop(column, axis=1, inplace=True)

# display the new csv matrix
print(insurance)

# the new columns, which all now have numerical data
labels = ["age", "male", "female", "bmi", "children", "yes", "no", "northeast", "northwest", "southeast", "southwest"]

# create the independent and dependent matrices
X = insurance[labels]
y = insurance["charges"]

# calculate the linear regression
regr = linear_model.LinearRegression()
regr.fit(X, y)

# display the weights for each column
for i, label in enumerate(labels):
    print(label + ": " + str(regr.coef_[i])) # column: weight

# display the r-squared value:
print("\nr-squared: " + str(regr.score(X, y))) # r-squared ≈ 0.751