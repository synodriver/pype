from .PX_Typedef cimport *
from .PX_MemoryPool cimport px_memorypool
cdef extern from "..\..\PainterEngine\core\PX_String.h" nogil:
    ctypedef struct px_string:
        px_char * buffer
        px_memorypool *mp
        px_int bufferlen
