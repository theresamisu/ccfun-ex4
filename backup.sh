#!/bin/bash

file_date=$(date -r test +"%Y%m%d%H%M")
date=$(date +"%Y%m%d%H%M")

# path to the directory 
path=/Users/theresa/Documents/Theresa/UH/CCFUN/test/*

d=`date +%Y-%m-%d-%H-%M`
aws s3 cp test s3://datasetexercise42/backup/$d --recursive

while [ true ] ; do

old_date=$date
date=$(date +"%Y%m%d%H%M")
d=`date +%Y-%m-%d-%H-%M`

for filename in $path; do
file_date=$(date -r $filename +"%Y%m%d%H%M")

if [ $old_date -le $file_date ];
then
# path to s3 bucket
aws s3 cp $filename s3://datasetexercise42/backup/$d/$(basename $filename)
fi

done

echo "sleep one minute" 
sleep 60s
done