

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
SET(ProjDirPath ${PROJECT_SOURCE_DIR}/source)

set(CMAKE_MODULE_PATH
    ${SdkRootDirPath}/cmakeModules
    ${SdkRootDirPath}/devices/MIMXRT1062/drivers
    ${SdkRootDirPath}/rtos/freertos/freertos-kernel
    ${SdkRootDirPath}/devices/MIMXRT1062
    ${SdkRootDirPath}/devices/MIMXRT1062/utilities
    ${SdkRootDirPath}/components/uart
    ${SdkRootDirPath}/components/serial_manager
    ${SdkRootDirPath}/components/lists
    ${SdkRootDirPath}/devices/MIMXRT1062/xip
    ${SdkRootDirPath}/boards/evkbmimxrt1060/xip
    ${SdkRootDirPath}/CMSIS/Core/Include
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
