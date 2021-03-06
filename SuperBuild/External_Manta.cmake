
# The Manta external project for ParaView
set(Manta_source "${CMAKE_CURRENT_BINARY_DIR}/Manta")
set(Manta_binary "${CMAKE_CURRENT_BINARY_DIR}/Manta-build")

set(Manta_build_shared ON)
if(WIN32)
  set(Manta_build_shared OFF)
endif()

ExternalProject_Add(Manta
  DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}
  SOURCE_DIR ${Manta_source}
  BINARY_DIR ${Manta_binary}
  URL ${MANTA_URL}/${MANTA_GZ}
  URL_MD5 ${MANTA_MD5}
  CMAKE_CACHE_ARGS
    -DCMAKE_CXX_FLAGS:STRING=${pv_tpl_cxx_flags}
    -DCMAKE_C_FLAGS:STRING=${pv_tpl_c_flags}
    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_CFG_INTDIR}
    -DBUILD_SHARED_LIBS:BOOL=${Manta_build_shared}
    -DBUILD_TESTING:BOOL=OFF
    -DMANTA_ENABLE_X11:BOOL=OFF
    -DSCENE_0:BOOL=OFF
    -DSCENE_AREA_LIGHT:BOOL=OFF
    -DSCENE_BEACH:BOOL=OFF
    -DSCENE_COMPLEXITYTEST:BOOL=OFF
    -DSCENE_CUBE_WORLD:BOOL=OFF
    -DSCENE_EXTERNAL_OBJECT:BOOL=OFF
    -DSCENE_FENCE:BOOL=OFF
    -DSCENE_GALILEO:BOOL=OFF
    -DSCENE_GRIDISOVOL:BOOL=OFF
    -DSCENE_HDRI:BOOL=OFF
    -DSCENE_MACBETH:BOOL=OFF
    -DSCENE_OCTISOVOL:BOOL=OFF
    -DSCENE_PRIMTEST:BOOL=OFF
    -DSCENE_SOFT_SHADOW:BOOL=OFF
    -DSCENE_TEAPOT_ROOM:BOOL=OFF
    -DSCENE_TRIANGLESCENEVIEWER:BOOL=OFF
    -DSCENE_TYLENOL:BOOL=OFF
    -DSCENE_VALUE_COLORMAP:BOOL=OFF
    -DSCENE_VORPAL:BOOL=OFF
    ${pv_tpl_compiler_args}
  CMAKE_ARGS
    ${Manta_EXTRA_ARGS}
  INSTALL_COMMAND ""
  )

set(Manta_DIR "${Manta_binary}" CACHE PATH "Manta binary directory" FORCE)
mark_as_advanced(Manta_DIR)
