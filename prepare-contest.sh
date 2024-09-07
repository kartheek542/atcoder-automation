#!/bin/bash

contest=$1
curl -s https://atcoder.jp/contests/$contest/tasks | grep "/contests/$contest/tasks/$contest" | sed -Ee 's/^.*<a.*"(.+)".*$/\1/g' | uniq > $contest.problems
itr=0

mkdir -p ./$contest

for line in $(cat $contest.problems);
do
    ques=$(echo "" | awk -v num="$(($itr + 65))" '{printf "%c", num}')
    echo "file name is $ques"
    prob_file=$(basename $line)
    echo "prob_file is $prob_file"
    problem_url="https://atcoder.jp$line"
    curl -s $problem_url > $prob_file
    start_line=$(cat $prob_file | grep -n "Sample Input 1" | sed -Ee "s/^([0-9]+):.*$/\1/g")
    prob_io="${prob_file}_trimed"
    echo "prob_io is $prob_io"
    cat $prob_file | tail -n +$start_line > $prob_io
    rm -f $prob_file
    cp ./template.java ./$contest/$ques.java
    sed -i "s/#CLASS#/$ques/g" ./$contest/$ques.java
    sed -i "s/#TESTS#/1/g" ./$contest/$ques.java
    ./extract_io.py $prob_io >> ./$contest/$ques.java
    rm -f $prob_io
    itr=$((itr + 1))

done

rm -f $contest.problems
