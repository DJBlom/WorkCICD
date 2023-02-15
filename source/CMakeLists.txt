project(Orion)
include(ProjectFiles)

if(CMAKE_TOOLCHAIN_FILE AND BUILD_ORION)

    add_executable(${MCUX_SDK_PROJECT_NAME}
	    ${${PROJECT_NAME}Main}
        ${${PROJECT_NAME}SourceFiles}
        ${CoreSystemSourceFiles}
        ${SdkSourceFiles}
    )

    target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
        ${SdkHeaderFiles}
    )

    # include modules
    include(flags)

    include(config)
    
    include(driver_clock_MIMXRT1062)

    include(middleware_freertos-kernel_heap_4_MIMXRT1062)

    include(driver_common_MIMXRT1062)

    include(device_MIMXRT1062_CMSIS_MIMXRT1062)

    include(utility_debug_console_MIMXRT1062)

    include(component_lpuart_adapter_MIMXRT1062)

    include(component_serial_manager_MIMXRT1062)

    include(component_lists_MIMXRT1062)

    include(component_serial_manager_uart_MIMXRT1062)

    include(driver_lpuart_MIMXRT1062)

    include(device_MIMXRT1062_startup_MIMXRT1062)

    include(driver_iomuxc_MIMXRT1062)

    include(utility_assert_MIMXRT1062)

    include(driver_igpio_MIMXRT1062)

    include(driver_xip_device_MIMXRT1062)

    include(driver_xip_board_evkbmimxrt1060_MIMXRT1062)

    include(middleware_freertos-kernel_MIMXRT1062)

    include(middleware_freertos-kernel_extension_MIMXRT1062)

    include(utilities_misc_utilities_MIMXRT1062)

    include(CMSIS_Include_core_cm_MIMXRT1062)

    include(device_MIMXRT1062_system_MIMXRT1062)


    IF(NOT DEFINED TARGET_LINK_SYSTEM_LIBRARIES)
    SET(TARGET_LINK_SYSTEM_LIBRARIES "-lm -lc -lgcc -lnosys")
    ENDIF()

    TARGET_LINK_LIBRARIES(${MCUX_SDK_PROJECT_NAME} PRIVATE -Wl,--start-group)

    target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE ${TARGET_LINK_SYSTEM_LIBRARIES})

    TARGET_LINK_LIBRARIES(${MCUX_SDK_PROJECT_NAME} PRIVATE -Wl,--end-group)
endif()

find_program(CPPCHECK cppcheck)
if(CPPCHECK AND BUILD_STATIC)
    include(StaticCodeAnalysis)
    StaticCodeAnalysis()
endif()
