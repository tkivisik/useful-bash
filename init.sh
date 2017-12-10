#!/bin/bash
mkdir paste_testing_folder cut_testing_folder cat_testing_folder diff_testing_folder split_testing_folder

# Files for paste_testing_folder
name_file_path=paste_testing_folder/names.txt
echo Hannah > $name_file_path
echo Joe >> $name_file_path
echo Maria >> $name_file_path
echo Sebastian >> $name_file_path

age_file_path=paste_testing_folder/ages.txt
echo 21 > $age_file_path
echo 22 >> $age_file_path
echo 20 >> $age_file_path
echo 23 >> $age_file_path

# Files for cut_testing_folder
cut_file_path=cut_testing_folder/cut_the_third_column.txt
echo a,1,2,3,4,5,6 > $cut_file_path
echo b,4,3,5,0,8,9 >> $cut_file_path
echo c,8,4,6,4,8,6 >> $cut_file_path
echo d,4,6,3,5,5,5 >> $cut_file_path

# Files for cat_testing_folder
echo name,fame > cat_testing_folder/column_header.txt
echo Hannah,75 > cat_testing_folder/row1.txt
echo Joe,65 > cat_testing_folder/row2.txt
echo Maria,85 > cat_testing_folder/row3.txt
echo Sebastian,95 > cat_testing_folder/row4.txt

# Files for diff_testing_folder
older_file_path=diff_testing_folder/base_file.txt
newer_file_path=diff_testing_folder/lines_added_removed.txt
newest_file_path=diff_testing_folder/lines_changed.txt

echo first > $older_file_path
echo second >> $older_file_path
echo third >> $older_file_path
echo fourth >> $older_file_path
echo fifth >> $older_file_path
echo sixth >> $older_file_path
echo seventh >> $older_file_path

cp $older_file_path $newer_file_path
## Deletes the 4th to 5th line
sed -i '4,5d' $newer_file_path
## insert 'after_second_before_third' after second line (2i), replace the existing file in place (-i)
sed -i '2iafter_second_before_third' $newer_file_path 

cp $older_file_path $newest_file_path
sed -i 's/e[cn]/E/g' $newest_file_path


# File for split_testing_folder
split_testing_folder=split_testing_folder
for i in {1..30250}; do
    # % does a modulus division. E.g. 13 % 2 = 1
    echo $(( ( RANDOM % 10 )  + 1 )) >> $split_testing_folder/1.txt
    echo $(( ( RANDOM % 100 )  + 1 )) >> $split_testing_folder/2.txt
    echo $(( ( RANDOM % 20 )  + 1 )) >> $split_testing_folder/3.txt
    echo $(( ( RANDOM % 50 )  + 1 )) >> $split_testing_folder/4.txt
    done
paste -d ',' $split_testing_folder/1.txt $split_testing_folder/2.txt $split_testing_folder/3.txt $split_testing_folder/4.txt > $split_testing_folder/split_this.txt
rm $split_testing_folder/?.txt
