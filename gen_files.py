#!/usr/bin/python3

import sys

file = open(sys.argv[1], 'r').readlines()
n = len(file)

curr = 0
test = 0

while curr < n:
    if file[curr].strip() == "-----":
        test += 1
        curr += 1
        input_file_name = "inp" + str(test) + ".in"
        inp_file = open(input_file_name, 'w')
        while file[curr].strip() != "-----":
            inp_file.write(file[curr])
            curr += 1
        inp_file.close()

        curr += 2
        output_file_name = "output" + str(test) + ".out"
        out_file = open(output_file_name, 'w')
        while file[curr].strip() != "-----":
            out_file.write(file[curr])
            curr += 1
        out_file.close()
    curr += 1
print(test)
