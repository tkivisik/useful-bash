#!/usr/bin/env bash
mkdir -p playground/paste_testing_folder playground/cut_testing_folder playground/cat_testing_folder playground/diff_testing_folder playground/split_testing_folder

# Files for paste_testing_folder
file_path=playground/paste_testing_folder/names.txt
cat > "$file_path" << EOF
Hannah
Joe
Maria
Sebastian
Kristine
Jean
EOF

file_path=playground/paste_testing_folder/ages.txt
cat > "$file_path" << EOF
21
22
20
23
30
33
EOF

# Files for cut_testing_folder
file_path=playground/cut_testing_folder/cut_the_third_column.txt
cat > "$file_path" << EOF
a,1,2,3,4,5,6
b,4,3,5,0,8,9
c,8,4,6,4,8,6
d,4,6,3,5,5,5
EOF

# Files for cat_testing_folder
echo "name,fame" > "playground/cat_testing_folder/column_header.txt"
echo "Hannah,75" > "playground/cat_testing_folder/row1.txt"
echo "Joe,65" > "playground/cat_testing_folder/row2.txt"
echo "Maria,85" > "playground/cat_testing_folder/row3.txt"
echo "Sebastian,95" > "playground/cat_testing_folder/row4.txt"

# Files for diff_testing_folder
older_file_path=playground/diff_testing_folder/base_file.txt
newer_file_path=playground/diff_testing_folder/lines_added_removed.txt
newest_file_path=playground/diff_testing_folder/lines_changed.txt

cat > "$older_file_path" << EOF
first
second
third
fourth
fifth
sixth
seventh
EOF

cp $older_file_path $newer_file_path
## Deletes the 4th to 5th line
sed -i '4,5d' "$newer_file_path"
## insert 'after_second_before_third' as third line (3i), replace the existing file in place (-i)
sed -i '3iafter_second_before_third' "$newer_file_path" 

cp $older_file_path $newest_file_path
sed -i 's/e[cn]/E/g' "$newest_file_path"


# File for split_testing_folder
split_testing_folder=playground/split_testing_folder
for i in {1..30250}; do
    # % does a modulus division. E.g. 13 % 2 = 1
    echo "$(( ( RANDOM % 10 )  + 1 ))" >> "$split_testing_folder/1.txt"
    echo "$(( ( RANDOM % 100 )  + 1 ))" >> "$split_testing_folder/2.txt"
    echo "$(( ( RANDOM % 20 )  + 1 ))" >> "$split_testing_folder/3.txt"
    echo "$(( ( RANDOM % 50 )  + 1 ))" >> "$split_testing_folder/4.txt"
    done
paste -d ',' "$split_testing_folder/1.txt" "$split_testing_folder/2.txt" "$split_testing_folder/3.txt" "$split_testing_folder/4.txt" > "$split_testing_folder/split_this.txt"
rm "$split_testing_folder/1.txt" "$split_testing_folder/2.txt" "$split_testing_folder/3.txt" "$split_testing_folder/4.txt"
