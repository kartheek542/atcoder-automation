#!/bin/bash

automation_home="#AUTOMATION_HOME#"
contest=$1
atcoder_cookie=""
curl -s "https://atcoder.jp/contests/$contest/tasks" -H "cookie: REVEL_SESSION=$atcoder_cookie" | grep "/contests/$contest/tasks/$contest" | sed -Ee 's/^.*<a.*"(.+)".*$/\1/g' | uniq > $contest.problems
itr=0

total_problems=$(cat $contest.problems | wc -l)
if [ $total_problems -eq 0 ];
then
    echo "Please check internet connectivity or cookie"
    exit 1
fi


mkdir -p ./$contest

for line in $(cat $contest.problems);
do
    ques=$(echo "" | awk -v num="$(($itr + 65))" '{printf "%c", num}')
    echo "file name is $ques"
    prob_file=$(basename $line)
    echo "prob_file is $prob_file"
    problem_url="https://atcoder.jp$line"
    curl -s $problem_url -H "cookie: REVEL_SESSION=$atcoder_cookie" > $prob_file
    start_line=$(cat $prob_file | grep -n "Sample Input 1" | sed -Ee "s/^([0-9]+):.*$/\1/g")
    prob_io="${prob_file}_trimed"
    echo "prob_io is $prob_io"
    cat $prob_file | tail -n +$start_line > $prob_io
    rm -f $prob_file
    cp $automation_home/atcoder-automation/template.java ./$contest/$ques.java
    sed -i "s/#CLASS#/$ques/g" ./$contest/$ques.java
    sed -i "s/#TESTS#/1/g" ./$contest/$ques.java
    sed -i 's/&lt;/</g' $prob_io
    sed -i 's/&gt;/>/g' $prob_io
    $automation_home/atcoder-automation/extract_io.py $prob_io >> ./$contest/$ques.java
    rm -f $prob_io
    itr=$((itr + 1))

done

rm -f $contest.problems
