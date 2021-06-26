# cython: language_level=3
from .PX_Typedef cimport *
from .PX_MemoryPool cimport px_memorypool
cdef extern from "..\..\PainterEngine\core\PX_Vector.h" nogil:
    ctypedef struct px_vector:
        px_void *data
        px_int nodesize
        px_int size
        px_int allocsize
        px_memorypool *mp
