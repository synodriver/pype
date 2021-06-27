cmake_minimum_required(VERSION 3.18)
project(pype)
set(CMAKE_C_STANDARD 99)
set(LIBRARY_OUTPUT_DIRECTORY ./pype)
set(CYTHON_GEN_DIR ./pype)


find_package(PythonExtensions REQUIRED)
find_package(Cython REQUIRED)


aux_source_directory(${PROJECT_SOURCE_DIR}/PainterEnginel/core CORE_SOUERCE_DIR)
aux_source_directory(${PROJECT_SOURCE_DIR}/PainterEnginel/kernel KERNEL_SOURCE_DIR)
aux_source_directory(${PROJECT_SOURCE_DIR}/PainterEnginel/architecture ARCHIVE_SOURCE_CODE)
add_library(PainterEnginel SHARED ${CORE_SOUERCE_DIR} ${KERNEL_SOURCE_DIR} ${ARCHIVE_SOURCE_CODE})

add_cython_target(_core pype/_core.pyx C OUTPUT_VAR ${CYTHON_GEN_DIR})
add_library(_core MODULE ${_core})
python_extension_module(_core)
target_link_libraries(_core PainterEnginel)