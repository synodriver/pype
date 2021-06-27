# cython: language_level=3
# http://painterengine.com/manual.html
from .PX_Typedef cimport *
from .PX_MemoryPool cimport *
from .PX_Quicksort cimport *
from .PX_Linker cimport *
from .PX_List cimport *
from .PX_Vector cimport *
from .PX_Hashmap cimport *
from .PX_Memory cimport *
from .PX_String cimport *
cdef extern from "..\..\PainterEngine\core\PX_Core.h" nogil:
    # PX_COUNTOF(x) (sizeof(x)/sizeof(x[0])) 预编译
    # 日志/调试信息
    void PX_LOG(char fmt[])
    void PX_ERROR(char fmt[])
    char *PX_GETLOG(void)
    void PX_ASSERT(void)
    # 内存
    void px_memcpy(void *dst, void *src, px_uint size)  # 内存拷贝
    void px_memset(void *dst, px_byte byte, px_uint size)  # 内存设值
    void px_memdwordset(void *dst, px_dword dw, px_uint count)  # 按4字节对齐设置内存值
    px_bool px_memequ(void *dst, void *src, px_uint size)  # 内存比对
    # 内存池
    px_memorypool MP_Create(void *MemoryAddr, unsigned int MemorySize)  # 创建内存池
    px_uint MP_Size(px_memorypool *Pool, px_void *Ptr)  # 返回一块内存指针所指向内存的内存大小
    void *MP_Malloc(px_memorypool *Pool, unsigned int Size)  # 从内存池分配一块内存
    void MP_Free(px_memorypool *Pool, void *pAddress)  # 从内存池释放一块内存
    px_void MP_Release(px_memorypool *Pool)
    void MP_Reset(px_memorypool *Pool)  # 重置内存池
    px_void MP_ErrorCatch(px_memorypool *Pool, PX_MP_ErrorCall ErrorCall)  # 设置内存池异常回调
    # 字符串操作
    void px_strcpy(px_char *dst, px_char *src, px_uint size)  #字符串拷贝函数
    void px_wstrcpy(px_word *dst, px_word *src, px_uint size)  # 宽字符串拷贝函数
    px_int px_strlen(px_char *dst)  # 字符串长度
    px_int px_wstrlen(px_word *dst)  #宽字符字符串长度
    px_void px_strset(px_char *dst, const px_char *src)  #字符串设置
    px_void px_strcat(px_char *src, const px_char *cat)  # 字符串拼接
    px_void px_wstrcat(px_word *src, const px_word *cat)  #宽字符串拼接
    px_void px_strupr(px_char *src)  # 字符串转大写
    px_void px_strlwr(px_char *src)  # 字符串转小写
    px_bool px_strequ(px_char *src, px_char *dst)  # 字符串全等
    px_bool px_strIsNumeric(px_char *src)  # 字符串是否是数字
    px_bool px_strIsFloat(px_char *src)  # 字符串是否是小数
    px_bool px_strIsInt(px_char *src)  # 字符串是否是整数
    px_char *PX_strchr(const char *s, int ch)  # 字符串查找字符
    char*PX_strstr(const char*dest, const char*src)  # 字符串查找字符串
    px_int px_sprintf1(px_char *_out_str, px_int str_size, px_char fmt[], px_stringformat _1)  #字符串格式化
    px_int px_sprintf2(px_char *_out_str, px_int str_size, px_char fmt[], px_stringformat _1, px_stringformat _2)
    px_int px_sprintf2(px_char *_out_str, px_int str_size, px_char fmt[], px_stringformat _1, px_stringformat _2,
                       px_stringformat _3)
    # 取得文件路径的文件名
    px_void PX_FileGetName(const px_char filefullName[], px_char _out[], px_int outSize)
    px_void PX_FileGetPath(const px_char filefullName[], px_char _out[], px_int outSize)  # 取得文件路径的路径
    px_void PX_FileGetExt(const px_char filefullName[], px_char _out[], px_int outSize)  #取得文件路径的后缀名
    # 转换
    px_void PX_BufferToHexString(px_byte data[], px_int size, px_char hex_str[])  # 数据类型转十六进制字符串类型
    px_bool PX_HexStringToBuffer(const px_char hex_str[], px_byte data[])  # 十六进制字符串转字节类型
    px_uint PX_htoi(char*a)  # 十六进制字符转数字
    px_int PX_atoi(char*a)  #字符转数字
    px_float PX_atof(px_char fstr[])
    px_dword PX_inet_addr(px_char i[])  # 字符串转IPv4地址
    px_char*PX_inet_ntoa(px_dword ipv4)  # IPv4地址转字符串
    px_int PX_itoa(px_int num, px_char *str, px_int MaxStrSize, px_int radix)  # 数字转字符串
    # PX_RETRUN_STRING PX_itos(px_int num,px_int radix)
    px_int *PX_ftoa(float num, char *str, px_int size, px_int precision)  # 小数转字符串

    PX_RETURN_STRING PX_ftos(px_float f, int precision)
    PX_RETURN_STRING PX_itos(px_int num, px_int radix)
    px_void PX_AscToWord(const px_char *asc, px_word *u16)
    px_dword PX_SwapEndian(px_dword val)

    # PX_RETRUN_STRING PX_ftos(float f, int precision)
    # 弧度角度转换 #define  PX_RadianToAngle(radian) ((radian)*180/PX_PI)
    #define  PX_AngleToRadian(angle) ((angle)*PX_PI/180)
    # 字节序
    px_dword PX_htonl(px_dword h)  # 主机字节序转网络字节序
    px_word PX_htons(px_word h)
    px_dword PX_ntohl(px_dword n)  # 网络字节序转主机字节序
    px_word PX_ntohs(px_word n)
    # 数学
    px_void PX_srand(px_uint64 seed)  # 初始化一个素数模乘同余发生器的随机数种子
    px_int PX_rand()  #返回一个0~PX_RAND_MAX-1之间的随机数
    px_uint32 PX_randEx(px_uint64 seed)  #返回一个0~PX_RAND_MAX-1之间的随机数以seed作为运算种子
    # 高斯随机数发生器
    px_int PX_GaussRand()  # 返回一个符合高斯分布的随机数
    #对数函数
    px_double PX_ln(px_double __x)  #求一个数e为底对数函数
    px_double PX_log(px_double __x)
    px_double PX_lg(px_double __x)  # 求一个数10为底对数函数
    px_double PX_log10(px_double __x)
    # 三角函数
    px_double PX_sind(px_double radian)  #弧度制求正弦
    px_double PX_cosd(px_double radian)  # 弧度制求正弦

    px_float PX_sin_radian(px_float radian)
    px_float PX_cos_radian(px_float radian)
    px_float PX_tan_radian(px_float radian)
    px_float PX_sin_angle(px_float angle)
    px_float PX_cos_angle(px_float angle)
    px_float PX_tan_angle(px_float angle)
    px_double PX_atan(px_double x)
    px_double PX_atan2(px_double y, px_double x)
    px_double PX_asin(px_double x)
    px_double PX_acos(px_double x)
    #平方根
    float PX_Sqrt(float number)  # 求一个数的平方根
    px_double PX_Sqrtd(px_double number)  # 求一个数更高精度的平方根
    float PX_SqrtRec(float number)  # 求一个数平方根的倒数
    # 方差
    px_double PX_Variance(px_double x[], px_int n)  # 计算一个序列的方差
    # 协方差
    px_double PX_Covariance(px_double x[], px_double y[], px_int n)  # 计算一个矩阵的协方差
    # 求绝对值
    # PX_ABS(x) #define  PX_ABS(x) ((x)>0?(x):-(x))
    px_double PX_tanh(px_double x)
    px_double PX_sigmoid(px_double x)
    px_double PX_ReLU(px_double x)
    #四舍五入 #define PX_APO(x) ((px_int)((x)+0.5f))
    #幂
    px_int PX_pow_ii(px_int i, px_int n)  # 	整数整幂
    px_double PX_pow_ff(double num, double m)  # 	num底数 m次幂
    # 复数
    px_complex PX_complexBuild(px_float re, px_float im)  #构造一个复数
    px_complex PX_complexAdd(px_complex a, px_complex b)  #复数相加
    px_complex PX_complexMult(px_complex a, px_complex b)  # 复数相乘
    px_double PX_complexMod(px_complex a)  #复数的模
    px_complex PX_complexLog(px_complex a)
    px_complex PX_complexExp(px_complex a)  #复数的e的次数
    px_complex PX_complexSin(px_complex a)  # 复数的sin值
    # 矩阵 缓冲区协议
    void PX_MatrixZero(px_matrix *Mat)  # 构造一个0矩阵
    void PX_MatrixIdentity(px_matrix *Mat)  # 构造一个单位矩阵
    px_matrix PX_MatrixMultiply(px_matrix Mat1, px_matrix Mat2)  # 矩阵相乘
    px_matrix PX_MatrixAdd(px_matrix Mat1, px_matrix Mat2)  # 矩阵相加
    px_matrix PX_MatrixSub(px_matrix Mat1, px_matrix Mat2)  # 矩阵相减
    px_bool PX_MatrixEqual(px_matrix Mat1, px_matrix Mat2)  # 判断两个矩阵是否相等
    px_void PX_MatrixRotateVector(px_matrix *mat, px_point v_base, px_point v)
    px_void PX_MatrixTranslation(px_matrix *mat, float x, float y, float z)  # 构造平移矩阵
    px_void PX_MatrixRotateX(px_matrix *mat, float Angle)  # 构造X轴旋转矩阵
    px_void PX_MatrixRotateY(px_matrix *mat, float Angle)  # 构造Y轴旋转矩阵
    px_void PX_MatrixRotateZ(px_matrix *mat, float Angle)  # 构造Z轴旋转矩阵
    px_void PX_MatrixRotateXRadian(px_matrix *mat, float rad)  # 构造X轴旋转矩阵
    px_void PX_MatrixRotateYRadian(px_matrix *mat, float rad)  # 构造Y轴旋转矩阵
    px_void PX_MatrixRotateZRadian(px_matrix *mat, float rad)  # 构造Z轴旋转矩阵
    px_void PX_MatrixScale(px_matrix *mat, float x, float y, float z)  # 构造缩放矩阵
    px_bool PX_MatrixInverse(px_matrix *mat)  # 	矩阵求逆
    px_void PX_MatrixTranspose(px_matrix *matrix)  # 	矩阵转置
    # 点/向量
    px_point2D PX_Point2DRotate(px_point2D p, px_float angle)  # 返回一个点绕原点顺时针旋转角度后的点
    px_point PX_PointRotate(px_point p, px_float angle)
    px_point PX_PointAdd(px_point p1, px_point p2)  # 向量相加
    px_point PX_Point2DAdd(px_point2D p1, px_point2D p2)
    px_point PX_Point4DAdd(px_point4D p1, px_point4D p2)
    px_point PX_PointSub(px_point p1, px_point p2)  # 向量相减
    px_point2D PX_Point2DSub(px_point2D p1, px_point2D p2)
    px_point4D PX_Point4DSub(px_point4D p1, px_point4D p2)
    px_point PX_PointMul(px_point p1, px_float m)  # 向量缩放
    px_point2D PX_Point2DMul(px_point2D p1, px_float m)
    px_point4D PX_Point4DMul(px_point4D p1, px_float m)
    px_point PX_PointDiv(px_point p1, px_float m)  # 向量缩放
    px_point2D PX_Point2DDiv(px_point2D p1, px_float m)
    px_point4D PX_PointDiv(px_point4D p1, px_float m)
    px_float PX_PointDot(px_point p1, px_point p2)  # 向量点乘
    px_float PX_Point2DDot(px_point2D p1, px_point2D p2)
    px_float PX_Point4DDot(px_point4D p1, px_point4D p2)
    px_point PX_PointCross(px_point p1, px_point p2)  # 向量叉乘
    px_point2D PX_Point2DCross(px_point2D p1, px_point2D p2)
    px_point4D PX_Point4DCross(px_point4D p1, px_point4D p2)
    px_float PX_PointMod(px_point p)  # 向量的模
    px_float PX_Point2DMod(px_point2D p)
    px_float PX_Point4DMod(px_point4D p)
    px_float PX_PointSquare(px_point p)  # 向量模的平方
    px_float PX_PointDistance(px_point p1, px_point p2)  #  求两点间距离
    px_point PX_PointNormalization(px_point p)  # 	求单位向量(归一化向量)
    px_point2D PX_Point2DNormalization(px_point p)
    px_point4D PX_Point4DNormalization(px_point p)
    px_point PX_PointMulMatrix(px_point p, px_matrix mat)  # 点乘矩阵
    px_point2D PX_Point2DMulMatrix(px_point p, px_matrix mat)
    px_float PX_Point_sin(px_point p)  # 求该向量与x轴夹角sin值
    px_float PX_Point_cos(px_point p)  # 求该向量与x轴夹角cos值
    px_point PX_PointReflectX(px_point vector_refer, px_point respoint)  # 参照向量关于x轴夹角对一个点做相应旋转
    px_point PX_PointInverse(px_point p1)  # 向量方向取反
    # 交叉碰撞
    px_bool PX_isLineCrossRect(px_point p1, px_point p2, px_rect rect, px_point *cp1,
                               px_point *cp2)  # 检测一条线与矩形是否相交
    px_bool PX_isRectCrossRect(px_rect rect1, px_rect rect2)  # 检测两个矩形是否有交叉碰撞
    px_bool PX_isRectCrossCircle(px_rect rect1, px_point center, px_float radius)  # 检测一个矩形和一个圆是否有交叉碰撞
    px_bool PX_isCircleCrossCircle(px_point center1, px_float radius1, px_point center2,
                                   px_float radius2)  # 检测两个圆是否有交叉碰撞
    # 快速排序(由小到大)
    void PX_Quicksort_MinToMax(PX_QuickSortAtom array[], px_int left, px_int right)  # 对特定结构体进行由小到大排序
    # 快速排序(由大到小)
    void PX_Quicksort_MaxToMin(PX_QuickSortAtom array[], px_int left, px_int right)  # 对特定结构体进行由大到小排序
    # 矩形
    px_rect PX_RECT(px_float x, px_float y, px_float width, px_float height)  # 构造一个矩形
    px_rect PX_RECTPOINT2(px_point p1, px_point p2)  # 用两个点构造一个矩形
    px_bool PX_isPointInRect(px_point p, px_rect rect)  # 判断点是否在矩形内
    px_bool PX_isRectInRect(px_rect rect1, px_rect rect2)  # 判断是两个矩形是否相交
    # CRC校验（CRC32）
    px_uint32 PX_crc32(px_byte *buffer, px_uint size)  # 对一段缓存区进行CRC32校验
    px_uint16 PX_crc16(px_byte *buffer, px_uint size)  # CRC校验（CRC16）
    px_uint32 PX_sum32(px_byte *buffer, px_uint size)  # 对一段缓存区进行累加和校验
    px_double PX_Bessel(int n, double x)  # 第一类修正贝塞尔函数
    # 通讯链接器(IO虚拟层)
    px_void PX_LinkerInitialize(PX_Linker *linker, PX_LinkerRead_func read, px_void *readUserPtr,
                                PX_LinkerWrite_func write, px_void *writeUserPtr)  #初始化链接器
    px_int PX_LinkerRead(PX_Linker *linker, px_void *data, px_int datasize)  # 链接器读
    px_int PX_LinkerWrite(PX_Linker *linker, px_void *data, px_int datasize)  #链接器写
    # 数据结构
    #取得结构体成员m对于结构体的偏移量#define PX_STRUCT_OFFSET(t,m)    ((((t *)0)->m-(px_byte *)0))
    px_void PX_CharIsNumeric(px_char ch)  # 判断字母是否是数字
    px_void PX_ListInitialize(px_list *list, px_memorypool *mp)  #对链表结构进行初始化
    px_void*PX_ListPush(px_list *list, px_void *data, px_int size)  # 插入一个数据到链表 todo 和文档不一样
    px_bool PX_ListPop(px_list *list, px_list_node *node)  # 将一个节点为node的数据从链表中删除
    px_bool PX_ListErase(px_list *list, px_int i)
    px_list_node*PX_ListNodeAt(px_list *list, px_int index)  # 取得链表当前节点指
    px_list_node*PX_ListNodeNext(px_list_node*node)  # 取得节点的下一个节点指针
    px_int PX_ListSize(px_list *list)  # 取得链表当前节点数
    px_void PX_ListMove(px_list *list, px_int index, px_int moveto)  # 移动节点
    px_void PX_ListClear(px_list *list)  #
    px_void PX_ListFree(px_list *list)  #
    # #define PX_LIST_NODEDATA(x) ((x)->pdata) # 取节点数据
    # #define PX_LIST_NODETDATA(t,x) ((t *)(x->pdata))
    # #define PX_LISTAT(t,x,i) ((t *)(PX_ListNodeAt(x,i)->pdata))
    px_void PX_VectorInitialize(px_vector *vec, px_memorypool *mp, px_int nodeSize, px_int init_size)  # 对容器结构进行初始化
    px_bool PX_VectorAllocSize(px_vector *vec, px_int size)
    px_bool PX_VectorPushback(px_vector *vec, px_void *data)  # 在容器中添加一个元素
    px_bool PX_VectorPushTo(px_vector *vec, px_void *data, px_int index)  # 在容器中指定位置添加一个元素
    px_bool PX_VectorSet(px_vector *vec, px_uint index,
                         px_void *data)  # 在容器中设定对应索引的元素,注意,如果索引小于分配容量,改容器将会重新分配内存空间以设定元素,同时索引小于使用大小,容器也会设定对应使用大小以适应设定索引
    px_bool PX_VectorErase(px_vector *vec, px_int index)  # 在容器中删除一个元素
    px_bool PX_VectorPop(px_vector *vec)
    px_void PX_VectorClear(px_vector *vec)  # 清空容器
    px_bool PX_VectorCopy(px_vector *destvec, px_vector *resvec)  # 拷贝容器
    px_void PX_VectorFree(px_vector *vec)  # 释放容器,同时释放内存,若需要重新使用该容器必须对其重新初始化
    px_bool PX_VectorResize(px_vector *vec, px_int size)  #重置容器的大小
    #define PX_VectorSize(x) ((x)->size)
    #ifdef PX_DEBUG_MODE
    #define PX_VECTORAT(t,vec,i) (sizeof(t)==(vec)->nodesize?((t *)((px_byte *)((vec)->data)+(vec)->nodesize*(i))):PX_NULL)
    #else
    #define PX_VECTORAT(t,vec,i) ((t *)((px_byte *)((vec)->data)+(vec)->nodesize*(i)))
    #endif
    #define PX_VECTORLAST(t,vec) PX_VECTORAT(t,vec,(vec)->size-1)
    #define PX_VectorClear(vec) ((vec)->size=0)
    # 字符串映射表
    px_bool PX_MapInitialize(px_memorypool *mp, px_map *hashmap)
    PX_HASHMAP_RETURN PX_MapPut(px_map *m, const px_char stringkey[], px_void *value)
    PX_HASHMAP_RETURN PX_MapPutInt(px_map *m, const px_char stringkey[], px_int value)
    PX_HASHMAP_RETURN PX_MapPutFloat(px_map *m, const px_char stringkey[], px_float value)
    PX_HASHMAP_RETURN PX_MapErase(px_map *m, const px_char stringkey[])
    px_map_element *PX_MapFirst(px_map *m)
    px_map_element *PX_MapNext(px_map *m, px_map_element *node)
    px_void *PX_MapGet(px_map *m, const px_char stringkey[])
    px_bool PX_MapGetInt(px_map *m, const px_char stringkey[], px_int *_int)
    px_bool PX_MapGetFloat(px_map *m, const px_char stringkey[], px_float *_float)
    px_void PX_MapFree(px_map *m)
    px_int PX_MapGetSize(px_map *m)
    #自适应内存
    px_void PX_MemoryInitialize(px_memorypool *mp, px_memory *memory)  # 对自适应内存结构进行初始化
    px_void PX_MemoryClear(px_memory *memory) # 清空内存,这个函数并不会释放占用内存空间
    px_bool PX_MemoryAlloc(px_memory *memory, px_int size)
    px_bool PX_MemoryResize(px_memory *memory, px_int size)  # 重置内存分配大小
    px_bool PX_MemoryCat(px_memory *memory, const px_void *buffer, px_int size)  # 对自适应内存进行数据拼接
    px_bool PX_MemoryCopy(px_memory *memory, const px_void *buffer, px_int startoffset,
                          px_int size)  # 拷贝内存到目标内存结构中,注意,这个函数会依据拷贝内存大小自动调整内存部署
    px_byte *PX_MemoryFind(px_memory *memory, const px_void *buffer, px_int size)  # 在内存中查找匹配内存 #todo 笔误
    px_void PX_MemoryRemove(px_memory *memory, px_int start, px_int end) # 移除一块内存区域,在区域之后的内存数据将自动拼接到移除的位置中
    px_void PX_MemoryFree(px_memory *memory)  # 	释放内存
    px_byte *PX_MemoryData(px_memory *memory)  # 取内存数据指针
    # 内存自适应字符串
    #define PX_STRING_DATA(x) (x->buffer)
    px_bool PX_StringInitialize(px_memorypool *mp, px_string *str)
    px_void PX_StringInitFromConst(px_string *str, const px_char *constchar)
    px_int PX_StringToInteger(px_string *str)
    px_float PX_StringToFloat(px_string *str)
    px_void PX_StringTrim(px_string *str)
    px_bool PX_StringCat(px_string *str, const px_char *str2)
    px_void PX_StringClear(px_string *str)
    px_bool PX_StringCatChar(px_string *str, px_char ch)
    px_int  PX_StringLen(px_string *str)
    px_void PX_StringFree(px_string *str)
    px_bool PX_StringCopy(px_string *dest, px_string *res)
    px_bool PX_StringInsertChar(px_string *str, px_int index, px_char ch)
    px_bool PX_StringRemoveChar(px_string *str, px_int index)
    px_void PX_StringReplaceRange(px_string *str, px_int startindex, px_int endindex, px_char *replaceto)
    px_void PX_StringTrimLeft(px_string *str, px_int leftCount)
    px_void PX_StringTrimRight(px_string *str, px_int RightCount)

    px_bool PX_StringIsNumeric(px_string *str)
    px_bool PX_StringIsFloat(px_string *str)

    # px_void PX_StringFormat(px_string *str, px_char fmt[], ...)
    px_void PX_StringReplace(px_string *str, px_char *source, px_char *replaceto)
    px_bool PX_StringInsert(px_string *str, px_int insertIndex, const px_char *InstrString)
    px_bool PX_StringTrimer_Solve(px_string *pstring, px_char *parseCode, px_char *ReplaceCode)
    px_void PX_StringInitAlloc(px_memorypool *mp, px_string *str, px_int allocSize)

    px_bool PX_StringFormat8(px_string *str, const px_char fmt[], px_stringformat _1, px_stringformat _2,
                             px_stringformat _3, px_stringformat _4, px_stringformat _5, px_stringformat _6,
                             px_stringformat _7, px_stringformat _8)
    px_bool PX_StringFormat7(px_string *str, const px_char fmt[], px_stringformat _1, px_stringformat _2,
                             px_stringformat _3, px_stringformat _4, px_stringformat _5, px_stringformat _6,
                             px_stringformat _7)
    px_bool PX_StringFormat6(px_string *str, const px_char fmt[], px_stringformat _1, px_stringformat _2,
                             px_stringformat _3, px_stringformat _4, px_stringformat _5, px_stringformat _6)
    px_bool PX_StringFormat5(px_string *str, const px_char fmt[], px_stringformat _1, px_stringformat _2,
                             px_stringformat _3, px_stringformat _4, px_stringformat _5)
    px_bool PX_StringFormat4(px_string *str, const px_char fmt[], px_stringformat _1, px_stringformat _2,
                             px_stringformat _3, px_stringformat _4)
    px_bool PX_StringFormat3(px_string *str, const px_char fmt[], px_stringformat _1, px_stringformat _2,
                             px_stringformat _3)
    px_bool PX_StringFormat2(px_string *str, const px_char fmt[], px_stringformat _1, px_stringformat _2)
    px_bool PX_StringFormat1(px_string *str, const px_char fmt[], px_stringformat _1)
    px_bool PX_StringSet(px_string *str, const px_char fmt[])







