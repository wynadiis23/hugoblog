#!/bin/bash

path=$(pwd)/content/posts
now=$(date +"%Y-%m-%d")

echo "**checking directory***"
if [[ ! -d $path ]]
then
    echo "$path does not exist on your filesystem."
    echo "***creating path***"
    mkdir $path
else
    echo "PASSED"
    echo "***input your posts's name***"
    read postname

    ##replace space with '-'
    postnamed="${postname// /-}"
    echo "***running hugo command creating posts for $postnamed***"
    ##hugo command to create new post based on path and post name
    hugo new $path/$now'-'$postnamed.md
    
    if [[ ! -f $path/$now'-'$postnamed.md ]]
    then
        echo "error cuk"
    else
        echo "create $now'-'$postnamed.md berhasil"
    fi
fi