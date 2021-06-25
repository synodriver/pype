from .PX_Typedef cimport *
cdef extern from "..\..\PainterEngine\core\PX_Linker.h" nogil:
    ctypedef px_int(*PX_LinkerRead_func)(px_void *userPtr, px_void *data, px_int datasize)
    ctypedef px_int(*PX_LinkerWrite_func)(px_void *userPtr, px_void *data, px_int datasize)
    ctypedef struct PX_Linker:
        PX_LinkerRead_func read
        px_void *readUserPtr
        PX_LinkerWrite_func write
        px_void *writeUserPtr