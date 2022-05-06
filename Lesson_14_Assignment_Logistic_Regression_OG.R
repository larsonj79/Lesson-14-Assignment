# Lesson 14 Assignment - Logistic Regression

# Your assignment is to write the commands instructed in the comments below. To run your
# commands, simply hit Ctrl+Enter (command+return on a MAC) when the cursor is on that 
# command line. You can also type commands directly into the Console below, but you must
# save them in this file for your assignment.

# Do not change these four lines or GradeScope will not work
library(readr)
library(dplyr)
ttnc <- read_csv("TitanicData.csv")
ttnc$Embarked[c(62, 830)] <- "S"

## Exploring Titanic Data

# We will be analyzing data from the famous Titanic dataset, which provides information 
# about the passengers on board the ill-fated ship. A description of the included
# variables can be found in the file TitanicVariables.png.

#1. Take a look at the first 10 rows of the data, named *ttnc*, to familiarize yourself 
# with it.


# Notice that I've removed ticket, fare, and cabin because they are too messy to use in 
# our analysis.

# Before jumping into a logistic regression analysis, we will do some exploration of 
# the data.

#2. Create a report that shows the following: the overall percent of passengers that 
# survived (percsurv), the proportion of males and females in the dataset (percmale
# and percfemale), and the proportion that embarked from each location (S, C and Q; 
# percS, percC, and percQ). (Hint: use a *summarize* statement without a preceding 
# *group_by* statement. To find the proportion of males, you can calculate 
# *mean(Sex == "male"))*.) Save the report as ttncpercs.


# Missing values can be problematic for an analysis. We are missing the ages of many 
# passengers. In dealing with missing data, we have several options. Here are two 
# options: (1) We can remove all rows of the data with missing ages. (2) We can fill 
# in those ages with the mean of the observed ages.

#3. Calculate the mean of the observed ages. Save the mean as meanage. (Hint: You 
# can't simply calculate the mean of Age, because it contains NA values. You must 
# use the *is.na()* to calculate the mean of only the rows where Age is not missing.)


# Now that you have calculated the mean of the observed ages, you can fill in all 
# the missing values with the mean age. But we are going to take a third option. We 
# will predict each passenger's age from the other information we have on them. That 
# is, we will run a regression model predicting age from variables like Pclass, Sex, 
# etc. Before we can run this regression model, we need to convert the categorical 
# variables to factor variables. The categorical variables in the data are Pclass, 
# Sex, and Embarked. (Survived is also a categorical variable, but leave it as a 
# numeric variable.)

#4. Convert categorical variables to factors.


#5. Run a regression model predicting Age from Pclass, Sex, SibSp, Parch, and 
# Embarked. Call the model *mod1*. Output a summary of the model. (Note: the lm 
# function will automatically ignore missing data, so the regression will run even 
# though many rows are missing Age.)


#6. Use *mod1* to predict the missing ages and save those predictions in *agepred*. 
# (Hint: use the *predict()* function and specify the newdata as the rows of *ttnc* 
# where Age is missing.)


#7. Create a new dataset, *ttnc2*, which is a copy of *ttnc*. Then fill in the 
# missing Age values of *ttnc2* with the predicted ages found in *agepred*. (Hint: 
# Assign *agepred* to the rows of ttnc2$Age that are missing.)


#8. Verify that *ttnc2$Age* has no missing values.


# For the remainder of the assignment, use *ttnc2*.

# First, let's analyze the effect of Sex on survival. 

#9. Run a logistic regression model predicting Survived from Sex. Call the analysis 
# *mod2* and output a summary of it.


#10. Does Sex affect survival probability?
# *ENTER ANSWER HERE*

#11. Were males or females more likely to survive?
# *ENTER ANSWER HERE*

#12. Use the mod2 coefficients to output the raw logistic regression output for 
# females. Save this value as fempred.


#13. Save the raw logistic regression output for males as malepred.


#14. Use *fempred* to calculate *fempredprob*, the probability of survival for a 
# female.


#15. Use *malepred* to calculatte *malepredprob*, the survival probability for a
# male.


# Let's now examine how Pclass affects survival probability.

#16. Run a logistic regression model predicting Survived from Pclass. Call the 
# model *mod3* and output a summary of the model.


#17. According to *mod3*, what is the probability of survival of First Class 
# passengers? Save it as fcpredprob.


#18. What is the probability of survival of Third Class passengers? Save it as
# tcpredprob.


# Let's put those models together.

#19. Run a logistic regression model predicting Survived from both Sex and 
# Pclass. Call it *mod4*. Output a summary of the model.


#20. According to *mod4*, what is the probability of survival of a male 
# traveling in Third Class? Save it as mtcpredprob.


#21. What is the probability of survival of a female traveling in Third Class?
# Save it as ftcpredprob.


# The model we just ran assumes that the effect of Pclass and the effect of 
# Sex are independent. That is, it assumes that the effect of being female is 
# the same for First Class, Second Class, and Third Class passengers. It may be 
# the case that being female benefits Third Class passengers more than it 
# benefits First Class passengers, or vice versa. 

#22. To examine this possibility, run a new model that includes the interaction
# between Sex and Pclass. Save it as mod5 and output a summary.


#23. According to *mod5*, what is the probability of survival of a male 
# traveling in Third Class? Save it as mtcpredprob2.


#24. What is the probability of survival of a female traveling in Third Class?
# Save it as ftcpredprob2.


# Notice the differences in predicted probability from *mod4* and *mod5*. 

#25. Compare the predicted probabilities from *mod5* with the actual survival 
# proportions of each combination of Sex and Pclass by creating a report of 
# the survival proportions from *ttnc2*. Save the report as ttncsurvprop.
# (Hint: Use *group_by* and *summarize*.)


#26. What is the correspondence between the predicted probabilities reported 
# in questions 23 and 24 and the report you just created?
# *ENTER ANSWER HERE*

#27. Notice the difference in survival proportions between First and Second 
# Class for females as opposed to males. Is moving from First Class to Second 
# Class more damaging to females' survival probability or to males' survival 
# probability?
# *ENTER ANSWER HERE*


#28. The last model we will run will predict Survived from Sex, Pclass, Age, 
# the interaction between Sex and Pclass and the interaction between Sex and 
# Age. Call this model *mod6* and output a summary of the model.


#29. How does Age affect the survival probability of females? Is this effect 
# statistically significant?
# *ENTER ANSWER HERE*


#30. How does Age affect the survival probability of males? Is this effect 
# statistically significant?
# *ENTER ANSWER HERE*


#31. The effect of Age differs for males and females (the definition of an 
# interaction term). Can you infer the reason for this difference?
# *ENTER ANSWER HERE.*


# Now let's consider how accurate *mod6* is in predicting survival.

#32. Output the model predictions (from *mod6*) to a variable called 
# *survpred*.


# Look at some of the observations in *survpred* (just use the console).

#33. On what scale are the values in *survpred*?
# *ENTER ANSWER HERE*


#34. Convert the values in *survpred* to 1s and 0s and call it 
# *survpredbin* ("bin" for binary).


#35. Create the confusion matrix table and save it as *confmat*. Print 
# it to the screen.


#36. Out of the 342 people in our dataset who survived the Titanic 
# disaster, how many did our model correctly predict as survivors?
# *ENTER ANSWER HERE*


#37. Out of the 549 people in our dataset who perished in the Titanic
# disaster, how many did our model correctly predict as doomed?
# *ENTER ANSWER HERE*


#38. In total, what is the percentage of passengers in our dataset 
# who are correctly predicted by *mod6*?
#*ENTER ANSWER HERE*


# Note that the percentage of correct predictions by itself is not a 
# good measure of the quality of a model, because if there had only 
# been 89 survivors, I could achieve 90% accuracy by simply predicting 
# that all of them perished. 

#39. If I were to predict that all the Titanic passengers perished, 
# what would be my percentage correct?
# *ENTER ANSWER HERE*


# **EXTRA CREDIT** *OPTIONAL*
# Apply *mod6* (or any other model) to predict survival of the Titanic 
# passengers found in *ttnctest*, which you can load by running the code 
# below. That data is missing the Survived variable because that forces 
# you to do an out-of-sample prediction (apply a model calibrated on other 
# data to this new data). Remember that you will have to convert some of 
# the variables to factor variables to make those predictions.
ttnctest <- read_csv("TitanicTestData.csv")


# Once you have made your predictions of the survival, yes or no, of the
# people in the ttnctest data, save them as *ttncpred*. Use the code
# below to save those to a file that you can export to your computer.
write_csv(ttncpred, "ttncpredout.csv")


# Once you have downloaded the file of your predictions, follow the 
# instructions found at https://www.kaggle.com/c/titanic/overview to (1) 
# create a submission file, (2) upload your submission to the Kaggle 
# website, and (3) find out how well your predictions performed. Take a 
# screenshot of your performance (Use PrintScreen on a PC or 
# command+shift+4 on a Mac) and upload that screenshot to the 
# corresponding location on Canvas. (This extra credit requires a bit of 
# time, so anyone completing it will receive 10 points of extra credit.)