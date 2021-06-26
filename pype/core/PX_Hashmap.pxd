# cython: language_level=3
from .PX_Typedef cimport *
cdef extern from "..\..\PainterEngine\core\PX_Hashmap.h" nogil:
    ctypedef enum PX_HASHMAP_RETURN:
        PX_HASHMAP_RETURN_OK
        PX_HASHMAP_RETURN_NULL
        PX_HASHMAP_RETURN_KEYEXIST
        PX_HASHMAP_RETURN_OUTOFMEMORY
        PX_HASHMAP_RETURN_FULL
        PX_HASHMAP_RETURN

    ctypedef struct px_map:
        pass

    ctypedef struct px_map_element:
        pass