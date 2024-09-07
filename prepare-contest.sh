#!/bin/bash

contest="arc183"
curl -s https://atcoder.jp/contests/$contest/tasks | grep "/contests/$contest/tasks/$contest" | sed -Ee 's/^.*<a.*"(.+)".*$/\1/g' | uniq > $contest.problems

for line in $(cat $contest.problems);
do
    prob_file=$(basename $line)
    echo "prob_file is $prob_file"
    problem_url="https://atcoder.jp$line"
    curl -s $problem_url > $prob_file
    start_line=$(cat $prob_file | grep -n "Sample Input 1" | sed -Ee "s/^([0-9]+):.*$/\1/g")
    prob_io="${prob_file}_trimed"
    echo "prob_io is $prob_io"
    cat $prob_file | tail -n +$start_line > $prob_io
    rm -f $prob_file

    ./extract_io.py $prob_io
    rm -f $prob_io

done

rm -f $contest.problems
