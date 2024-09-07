#!/bin/bash

contest="arc183"
curl -s https://atcoder.jp/contests/$contest/tasks | grep "/contests/$contest/tasks/$contest" | sed -Ee 's/^.*<a.*"(.+)".*$/\1/g' | uniq > $contest.problems

for line in $(cat $contest.problems);
do
    problem_url="https://atcoder.jp$line"
    echo $problem_url
done

rm -f $contest.problems
