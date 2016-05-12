#!/bin/bash
# bash generate random alphanumeric string
#
# https://gist.github.com/earthgecko/3089509
# bash generate random 32 character alphanumeric string (upper and lowercase) and 
NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

# bash generate random 32 character alphanumeric string (lowercase only)
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1
