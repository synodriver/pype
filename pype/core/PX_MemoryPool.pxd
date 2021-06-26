# cython: language_level=3
from .PX_Typedef cimport *
cdef extern from "..\..\PainterEngine\core\PX_MemoryPool.h" nogil:
    cdef enum PX_MEMORYPOOL_ERROR:
        PX_MEMORYPOOL_ERROR_OUTOFMEMORY # 内存池内存不足
        PX_MEMORYPOOL_ERROR_INVALID_ACCESS # 内存池指向内存无法读/写访问
        PX_MEMORYPOOL_ERROR_INVALID_ADDRESS # 释放无效的内存地址

    # 当内存池触发异常时将会执行该异常回调函数,如果没有设置异常回调将会以PX_ERROR进行处理
    ctypedef void (*PX_MP_ErrorCall)(PX_MEMORYPOOL_ERROR)

    ctypedef struct MP_alloc_debug:
        void *addr
        void *startAddr
        void *endAddr


    ctypedef struct MP_Append_data:
        px_dword append


    ctypedef struct px_memorypool:
        px_void *AllocAddr
        px_void *StartAddr
        px_void *EndAddr
        px_uint32 Size
        px_uint32 FreeSize
        px_uint32 nodeCount
        px_uint32 FreeTableCount
        px_uint32 MaxMemoryfragSize
        PX_MP_ErrorCall ErrorCall_Ptr
        MP_alloc_debug DEBUG_allocdata[1024]

