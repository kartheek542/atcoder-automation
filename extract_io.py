#!/usr/bin/python3

import sys

file = open(sys.argv[1]).read()
n = len(file)

io = []
curr = ""
load = False
flag = False

for i in range(5, n):
    if file[i - 6: i] == "Sample":
        flag = True
    if flag and file[i - 5: i] == "<pre>":
        load = True
    elif file[i: i + 6] == "</pre>":
        io.append(curr)
        load = False
        flag = False
        curr = ""
    if load:
        curr = f"{curr}{file[i]}"

print("/*")

for out in io:
    print("-----")
    print(out, end="")
    print("-----")

print("*/")
