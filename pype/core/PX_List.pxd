# cython: language_level=3
from .PX_Typedef cimport *
from .PX_MemoryPool cimport px_memorypool
cdef extern from "..\..\PainterEngine\core\PX_List.h" nogil:
    ctypedef struct px_list_node:
        px_void *pdata
        px_list_node *pnext
        px_list_node *ppre


    ctypedef struct px_list:
        px_memorypool *mp
        px_int size
        px_list_node *head
        px_list_node *end
