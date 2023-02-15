

# CROSS COMPILER SETTING
SET(CMAKE_SYSTEM_NAME Generic)
CMAKE_MINIMUM_REQUIRED (VERSION 3.10.0)
project(Orion)

# THE VERSION NUMBER
SET (Tutorial_VERSION_MAJOR 1)
SET (Tutorial_VERSION_MINOR 0)

# ENABLE ASM
ENABLE_LANGUAGE(ASM)

SET(CMAKE_STATIC_LIBRARY_PREFIX)
SET(CMAKE_STATIC_LIBRARY_SUFFIX)

SET(CMAKE_EXECUTABLE_LIBRARY_PREFIX)
SET(CMAKE_EXECUTABLE_LIBRARY_SUFFIX)



set(MCUX_BUILD_TYPES debug)
SET(EXECUTABLE_OUTPUT_PATH)
SET(LIBRARY_OUTPUT_PATH)

set(MCUX_SDK_PROJECT_NAME ${PROJECT_NAME}.elf)

if (NOT DEFINED SdkRootDirPath)
    SET(SdkRootDirPath ${PROJECT_SOURCE_DIR})
endif()
# CURRENT DIRECTORY
SET(ProjDirPath ${PROJECT_SOURCE_DIR})

set(CMAKE_MODULE_PATH
    ${SdkRootDirPath}/cmakeModules
    ${SdkRootDirPath}/CMSIS
    ${SdkRootDirPath}/component/uart
    ${SdkRootDirPath}/component/serial_manager
    ${SdkRootDirPath}/component/lists
    ${SdkRootDirPath}/device
    ${SdkRootDirPath}/drivers
    ${SdkRootDirPath}/freertos/freertos-kernel
    ${SdkRootDirPath}/startup
    ${SdkRootDirPath}/utilities
    ${SdkRootDirPath}/xip
)


set(BUILD_ORION CACHE BOOL OFF)
if(BUILD_ORION)
    add_subdirectory(source)
endif()

set(BUILD_STATIC CACHE BOOL OFF)
if(BUILD_STATIC)
    add_subdirectory(source)
endif()

set(BUILD_COVERAGE CACHE BOOL OFF)
if(BUILD_COVERAGE)
    enable_testing()
    add_subdirectory(test)
endif()

include (CTest)
