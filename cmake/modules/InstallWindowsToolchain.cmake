# Native producer supplies the DLLs from its selected MSVCRT toolchain.
# Use normal CMake installation so the manifest and the transported install
# include the runtime needed by cjc, LLVM/CJDB and the installed host flatc.
if(WIN32 AND CANGJIE_TOOLCHAIN_RUNTIME_FILES)
    foreach(runtime_file IN LISTS CANGJIE_TOOLCHAIN_RUNTIME_FILES)
        if(NOT EXISTS "${runtime_file}")
            message(FATAL_ERROR "Selected Windows toolchain runtime is missing: ${runtime_file}")
        endif()
    endforeach()
    foreach(destination bin third_party/llvm/bin third_party/flatbuffers/bin)
        install(FILES ${CANGJIE_TOOLCHAIN_RUNTIME_FILES} DESTINATION "${destination}")
    endforeach()
endif()
