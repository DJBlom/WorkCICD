

function(CompileProject)
    add_compile_options(
        $<$<CONFIG:DEBUG>:-g3>
        $<$<CONFIG:DEBUG>:-Og>
    )

    add_compile_definitions(
        $<$<CONFIG:DEBUG>:DEBUG>
    )

    add_executable(${PROJECT_NAME}
        $<$<CONFIG:DEBUG>:${${PROJECT_NAME}Main}>
        $<$<CONFIG:DEBUG>:${${PROJECT_NAME}StartupFiles}>
        $<$<CONFIG:DEBUG>:${${PROJECT_NAME}SourceFiles}>
    )

    target_include_directories(${PROJECT_NAME} PRIVATE 
        ${${PROJECT_NAME}HeaderFiles}
    )

    set(LINKER_SCRIPTS
        ${PROJECT_SOURCE_DIR}/../MIMXRT1062/gcc/MIMXRT1062xxxxx_ram.ld
    )

    set_target_properties(${PROJECT_NAME} PROPERTIES 
        SUFFIX .elf
        LINK_DEPENDS "${LINKER_SCRIPTS}"
    )

    target_link_options(${PROJECT_NAME} PRIVATE
        -T${PROJECT_SOURCE_DIR}/startup/${PROJECT_NAME}.ld
        LINKER:--print-memory-usage
        LINKER:-Map,${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.map
    )

    target_link_libraries(${PROJECT_NAME} PRIVATE bareMetal)
    target_link_libraries(${PROJECT_NAME} PRIVATE middleware)

    if (EXISTS ${CMAKE_OBJCOPY})
        add_custom_command(
            TARGET ${PROJECT_NAME}
            POST_BUILD
            COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:${PROJECT_NAME}>
                    ${CMAKE_CURRENT_BINARY_DIR}/$<TARGET_NAME:${PROJECT_NAME}>.hex
    )
    else ()
        message(STATUS "'objcopy' not found: cannot generate .hex file")
    endif()

    if (EXISTS "${TOOLCHAIN_SIZE}")
      add_custom_command(
        TARGET ${PROJECT_NAME} 
        POST_BUILD
        COMMAND ${TOOLCHAIN_SIZE} --format=berkeley $<TARGET_FILE:${PROJECT_NAME}>
                >${CMAKE_CURRENT_BINARY_DIR}/$<TARGET_NAME:${PROJECT_NAME}>.bsz
      )
      add_custom_command(
        TARGET ${PROJECT_NAME}
        POST_BUILD
        COMMAND ${TOOLCHAIN_SIZE} --format=sysv -x $<TARGET_FILE:${PROJECT_NAME}>
                >${CMAKE_CURRENT_BINARY_DIR}/$<TARGET_NAME:${PROJECT_NAME}>.ssz
        )
    else()
        message(STATUS "'size' not found: cannot generate .[bs]sz files")
    endif()
endfunction()
