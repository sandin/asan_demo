option(ENABLE_ASAN "Enable Address Sanitizer" OFF)

if (ENABLE_ASAN)
    message(STATUS "Enable ASAN, CMAKE_VERSION: ${CMAKE_VERSION}")
    set(ENABLE_ASAN_TARGETS
        #all
        native-lib
    )
    if("${ENABLE_ASAN_TARGETS}" STREQUAL "all")
        message(STATUS "Enable ASAN for all targets")
        add_compile_options(-fsanitize=address -fno-omit-frame-pointer)
        set(CMAKE_EXE_LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS} -fsanitize=address)
        set(CMAKE_SHARED_LINKER_FLAGS ${CMAKE_SHARED_LINKER_FLAGS} -fsanitize=address)
        set(CMAKE_STATIC_LINKER_FLAGS ${CMAKE_STATIC_LINKER_FLAGS} -fsanitize=address)
    else()
        foreach(TARGET ${ENABLE_ASAN_TARGETS})
            message(STATUS "Enable ASAN for target ${TARGET}")
            target_compile_options(${TARGET} PUBLIC -fsanitize=address -fno-omit-frame-pointer)
            set_target_properties(${TARGET} PROPERTIES LINK_FLAGS -fsanitize=address)
        endforeach()
    endif()
endif()