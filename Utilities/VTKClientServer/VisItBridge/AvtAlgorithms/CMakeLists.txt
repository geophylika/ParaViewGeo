SET(VTK_KITS_DIR "${VISITAVTALGORITHMS_KITS_DIR}")
INCLUDE_DIRECTORIES(${VISITAVTALGORITHMS_INCLUDE_DIRS})
SET(KIT_WRAP_DEPS Hybrid Rendering)
PV_WRAP_VTK_CS(VisItAVTAlgorithms VISITAVTALGORITHMS "${KIT_WRAP_DEPS}")
