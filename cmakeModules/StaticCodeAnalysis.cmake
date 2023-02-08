

function(StaticCodeAnalysis)
    set(STATIC_ANALYSIS ${PROJECT_NAME}StaticAnalysis)
    set(CMAKE_CXX_CPPCHECK "cppcheck")
    list(APPEND CMAKE_CXX_CPPCHECK "--enable=all" "--std=c++20" "--error-exitcode=1" "--platform=mips32"  "--check-config" "--suppress=missingInclude")

    add_executable(${STATIC_ANALYSIS}
        #${${PROJECT_NAME}Main}
        ${${PROJECT_NAME}SourceFiles}
        #${CoreSystemSourceFiles}
    )

    include_directories(${STATIC_ANALYSIS} PRIVATE
        ${${PROJECT_NAME}HeaderFiles}
        ${CoreSystemHeaderFiles}
    )

    target_link_libraries(${STATIC_ANALYSIS} PRIVATE)
endfunction()
