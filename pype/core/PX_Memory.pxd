# cython: language_level=3
from .PX_Typedef cimport *
from .PX_MemoryPool cimport px_memorypool
cdef extern from "..\..\PainterEngine\core\PX_Memory.h" nogil:
    ctypedef struct px_memory:
        px_byte *buffer
        px_memorypool *mp
        px_int  usedsize
        px_int  allocsize
