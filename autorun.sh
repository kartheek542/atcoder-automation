#!/bin/bash

automation_home="#AUTOMATION_HOME#"
ques=$(ls -t *.java | head -1)

javac $ques

n_tests=$($automation_home/atcoder-automation/gen_files.py $ques)

echo "there are $n_tests tests"

for num in $(seq $n_tests);
do
    echo "Running test: $num"
    echo "---------------"
    inp_name="inp${num}.in"
    real_output_name="act_output${num}.out"
    java $(basename $ques .java) < $inp_name > $real_output_name
    diff -y $real_output_name "output${num}.out" && echo -e "-----\nPASSED" || echo -e "-----\nFAILED"
    echo "-----"
done

rm -f *.in
rm -f *.out
rm -f *.class
