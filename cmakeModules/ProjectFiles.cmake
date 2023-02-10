
set(${PROJECT_NAME}Main
    ${CMAKE_SOURCE_DIR}/source/${PROJECT_NAME}.cpp
)

set(CoreSystemSourceFiles
    ${CMAKE_SOURCE_DIR}/source/coreSystem/src/CoreSystem.c
    ${CMAKE_SOURCE_DIR}/source/coreSystem/src/CoreSystemConfiguration.c
    ${CMAKE_SOURCE_DIR}/source/coreSystem/src/CoreSystemServices.c
    ${CMAKE_SOURCE_DIR}/source/coreSystem/src/CoreSystemWatchdog.c
)

set(CoreSystemHeaderFiles
    ${CMAKE_SOURCE_DIR}/source/coreSystem/include
    ${CMAKE_SOURCE_DIR}/source
)

set(SdkSourceFiles
    ${CMAKE_SOURCE_DIR}/devices/MIMXRT1062/project_template/board.c
    ${CMAKE_SOURCE_DIR}/devices/MIMXRT1062/project_template/clock_config.c
    ${CMAKE_SOURCE_DIR}/devices/MIMXRT1062/project_template/pin_mux.c
    ${CMAKE_SOURCE_DIR}/devices/MIMXRT1062/project_template/dcd.c
)

set(SdkHeaderFiles
    ${CMAKE_SOURCE_DIR}/devices/MIMXRT1062/project_template/
)

set(${PROJECT_NAME}SourceFiles
    ${CMAKE_SOURCE_DIR}/source/src/Add.c
)

set(${PROJECT_NAME}HeaderFiles
    ${CMAKE_SOURCE_DIR}/source/include
)


