#!/bin/bash
# Put in ˜/bin - Needs chmod 755 <filename>
# Execute: ./hello_world
az=($(aws ec2 describe-availability-zones --output text | cut -f 4))

index=0
element_count=${#az[*]}
while [ $index -lt $element_count ]
do
    echo ${az[$index]}
    # arithmetic evaluation ((x))
    ((index++))
done;
#
#  a=z                   # Assign the string "z" to variable a
#  b="a string"         # Embedded spaces must be within quotes.
#  c="a string and $b"  # Other expansions such as variables can be expanded into the assignment.
#  d=$(ls -l foo.txt)   # Results of a command.
#  e=$((5 * 7))         # Arithmetic expansion.
#  f="\t\ta string\n"   # Escape sequences such as tabs and newlines.
