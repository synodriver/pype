# cython: language_level=3
from .PX_Typedef cimport *
cdef extern from "..\..\PainterEngine\core\PX_Quicksort.h" nogil:
    ctypedef struct PX_QuickSortAtom:
        px_float weight
        px_void *pData