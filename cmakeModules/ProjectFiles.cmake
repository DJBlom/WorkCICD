
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
)

set(SdkSourceFiles
    ${CMAKE_SOURCE_DIR}/board/board.c
    ${CMAKE_SOURCE_DIR}/board/clock_config.c
    ${CMAKE_SOURCE_DIR}/board/dcd.c
    ${CMAKE_SOURCE_DIR}/board/pin_mux.c
)

set(SdkHeaderFiles
    ${CMAKE_SOURCE_DIR}/board
    ${CMAKE_SOURCE_DIR}/source/coreSystem/include
)

set(${PROJECT_NAME}SourceFiles
    ${CMAKE_SOURCE_DIR}/source/src/Add.c
)

set(${PROJECT_NAME}HeaderFiles
    ${CMAKE_SOURCE_DIR}/source/include
)


