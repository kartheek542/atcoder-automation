#!/bin/bash


home_path=$1

mkdir -p $home_path/atcoder-automation/

cp -f ./autorun.sh $home_path/atcoder-automation/
cp -f ./extract_io.py   $home_path/atcoder-automation/
cp -f ./gen_files.py   $home_path/atcoder-automation/
cp -f ./install.sh   $home_path/atcoder-automation/
cp -f ./prepare-contest.sh   $home_path/atcoder-automation/
cp -f ./template.java $home_path/atcoder-automation/

sed -i "s,#AUTOMATION_HOME#,$home_path,g" $home_path/atcoder-automation/prepare-contest.sh
sed -i "s,#AUTOMATION_HOME#,$home_path,g" $home_path/atcoder-automation/autorun.sh

ln -s $home_path/atcoder-automation/prepare-contest.sh act-init
ln -s $home_path/atcoder-automation/autorun.sh crun

mv act-init /usr/bin/
mv crun /usr/bin/
