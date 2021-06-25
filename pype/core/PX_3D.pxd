from .PX_Typedef cimport *
cdef extern from "..\..\PainterEngine\core\PX_3D.h" nogil:
	cdef enum PX_3D_RENDERLIST_TRANSFORM:
		PX_3D_RENDERLIST_TRANSFORM_LOCAL_TO_LOCAL
		PX_3D_RENDERLIST_TRANSFORM_LOACL_TO_GLOBAL
		PX_3D_RENDERLIST_TRANSFORM_GLOBAL_TO_GLOBAL

	cdef enum PX_3D_CULLMODE:
		PX_3D_CULLMODE_NONE
		PX_3D_CULLMODE_CW
		PX_3D_CULLMODE_CCW

	ctypedef void (*PX_3D_PixelShader)(px_surface *psurface,px_int x,px_int y,px_point position,px_float u,px_float v,px_point4D normal,px_texture *pTexture,px_color color)
