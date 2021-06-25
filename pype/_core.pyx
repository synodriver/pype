cimport core

cdef class MemoryPool:
    cdef core.px_memorypool *pool
    def __cinit__(self, unsigned int memorysize):
        cdef core.px_memorypool p
        self.pool = &p
        core.MP_Create(self.pool, memorysize)

    cdef core.px_uint size(self, core.px_void*ptr):
        return core.MP_Size(self.pool, ptr)

    cdef void *malloc(self, unsigned int size):
        return core.MP_Malloc(self.pool, size)

    cdef void free(self, void *paddress):
        core.MP_Free(self.pool, paddress)

    cdef void reset(self):
        core.MP_Reset(self.pool)
