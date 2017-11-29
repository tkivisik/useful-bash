#!/bin/bash
mkdir paste_testing_folder cut_testing_folder cat_testing_folder

# Files for paste_testing_folder
echo Hannah > paste_testing_folder/names.txt
echo Joe >> paste_testing_folder/names.txt
echo Maria >> paste_testing_folder/names.txt
echo Sebastian >> paste_testing_folder/names.txt

echo 21 > paste_testing_folder/ages.txt
echo 22 >> paste_testing_folder/ages.txt
echo 20 >> paste_testing_folder/ages.txt
echo 23 >> paste_testing_folder/ages.txt

# Files for cut_testing_folder
echo a,1,2,3,4,5,6 > cut_testing_folder/cut_the_third_column.txt
echo b,4,3,5,0,8,9 > cut_testing_folder/cut_the_third_column.txt
echo c,8,4,6,4,8,6 > cut_testing_folder/cut_the_third_column.txt
echo d,4,6,3,5,5,5 > cut_testing_folder/cut_the_third_column.txt

# Files for cat_testing_folder
echo name,fame > cat_testing_folder/column_header.txt
echo Hannah,75 > cat_testing_folder/row1.txt
echo Joe,65 > cat_testing_folder/row2.txt
echo Maria,85 > cat_testing_folder/row3.txt
echo Sebastian,95 > cat_testing_folder/row4.txt
