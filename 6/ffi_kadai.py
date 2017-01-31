import ctypes

ffi=ctypes.CDLL("./ffi_kadai_c.so")

ffi.kadai.argtypes=[ctypes.c_double*3,ctypes.c_double*3]
ffi.kadai.restypes=ctypes.c_double
ffi.kadai((ctypes.c_double*3)(1.0,2.1,0.5),(ctypes.c_double*3)(2.1,-1.0,0.1))
