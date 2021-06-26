# cython: language_level=3
cdef extern from "..\..\PainterEngine\core\PX_Typedef.h" nogil:
    ctypedef     void                px_void
    ctypedef     int                 px_bool
    ctypedef     unsigned int        px_dword  #typedef     uint32_t		       px_dword
    ctypedef     short               px_short
    ctypedef     short               px_int16
    ctypedef     unsigned short      px_word  #typedef     uint16_t		       px_word
    ctypedef     unsigned short      px_ushort
    ctypedef     unsigned short      px_uint16
    ctypedef     unsigned int        px_uint
    ctypedef     unsigned int        px_uint32  #typedef     uint32_t		   px_uint32
    ctypedef     int                 px_int
    ctypedef     int                 px_int32  #typedef     int32_t			   px_int32
    ctypedef     char                px_char
    ctypedef     unsigned char       px_byte
    ctypedef     unsigned char       px_uchar
    ctypedef     unsigned long       px_ulong
    ctypedef     long                px_long
    ctypedef     float               px_float
    ctypedef     float               px_float32  #IEEE 754 little-endian
    ctypedef     double              px_double
    ctypedef     double              px_double64
    ctypedef     unsigned long long  px_qword
    ctypedef     unsigned long long  px_uint64  #typedef     uint64_t			px_uint64
    ctypedef     long long           px_int64  #typedef      int64_t				px_int64

    cdef union A:
        px_char data[256]
        px_word wdata[128]
    ctypedef struct PX_RETURN_STRING:
        A

    cdef enum PX_ALIGN:
        PX_ALIGN_LEFTTOP
        PX_ALIGN_MIDTOP
        PX_ALIGN_RIGHTTOP
        PX_ALIGN_LEFTMID
        PX_ALIGN_CENTER
        PX_ALIGN_RIGHTMID
        PX_ALIGN_LEFTBOTTOM
        PX_ALIGN_MIDBOTTOM
        PX_ALIGN_RIGHTBOTTOM

    cdef enum PX_STRINGFORMAT_TYPE:
        PX_STRINGFORMAT_TYPE_INT,
        PX_STRINGFORMAT_TYPE_FLOAT,
        PX_STRINGFORMAT_TYPE_STRING,

    ctypedef struct px_matrix:
        px_float m[4][4]



    cdef union B:
        px_int _int
        px_float _float
        const px_char *_pstring
    ctypedef struct px_stringformat:
        PX_STRINGFORMAT_TYPE type
        B

    ctypedef struct px_point:
        px_float x
        px_float y
        px_float z

    ctypedef px_point px_point32

    ctypedef struct px_wpoint:
        px_double x
        px_double y
        px_double z

    ctypedef struct px_point2D:
        px_float x
        px_float y

    ctypedef px_point px_point3D
    ctypedef px_point px_vector3D

    ctypedef struct px_point4D:
        px_float x
        px_float y
        px_float z
        px_float w

    ctypedef px_point4D px_vertex
    ctypedef px_point4D px_vector4D

    ctypedef struct px_plane:
        px_point3D p0  # point on the plane
        px_vector3D n  # normal to the plane

    ctypedef struct px_rect:
        px_float x, y, width, height

    ctypedef struct px_complex:
        px_double re  # really
        px_double im  # imaginary
