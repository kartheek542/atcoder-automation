#!/usr/bin/python3

import sys

file = open(sys.argv[1])

x = file.read()
print(type(x))
print(x)

