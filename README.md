# Getting-and-Cleaning-Data


This is the README file for run_analysis.R, which gives an output of tidy.txt

Please refer to the README(Old).txt to get an idea of what is going on.

The run_analysis.R takes the same variables mentioned in README(Old).txt and turns them into a more R friendly version.
Variable names were converted into an alphanumeric form without any special characters.

The output—aka: tidy.txt— variables consist of only:

1. variables of means (any variable name that contains the string "mean" in it)
2. variables of standarad deviations (any variable name that contains the string "std" in it)
3. the subject variable (subject)
4. and the movement label variable (movlabel)
