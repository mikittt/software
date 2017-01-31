#!/usr/bin/env python

import ctypes
ffi=ctypes.CDLL('./fibonacci-c.so')

ffi.fibonacci.argtypes=[ctypes.c_int]
print ffi.fibonacci(10)
