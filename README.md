# Getting and Cleaning Data


This is the README file for run_analysis.R

Merely running this script will give you an output of tidy.txt

The run_analysis.R does the following:
* Takes the same variables mentioned in README(Old).txt and turns them into a more R friendly and tidy version. Variable names get converted into an alphanumeric form without any special characters.
* Produces an output "tidy.txt" whose variables consist of only:
    1. variables of means (any variable name that contains the string "mean" in it)
    2. variables of standarad deviations (any variable name that contains the string "std" in it)
    3. the subject variable (subject)
    4. and the movement label variable (movlabel)
