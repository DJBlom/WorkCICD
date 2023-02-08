
set(CODE_COVERAGE CodeCoverage)
function(${CODE_COVERAGE})
    add_executable(${CODE_COVERAGE}
        ${${PROJECT_NAME}SourceFiles}
        ${${PROJECT_NAME}TestSourceFiles}
    )

    include_directories(${CODE_COVERAGE} PRIVATE
        ${${PROJECT_NAME}HeaderFiles}
        ${${PROJECT_NAME}TestHeaderFiles}
    )

    target_link_libraries(${CODE_COVERAGE} PRIVATE
        gcov
        ${${PROJECT_NAME}TestLinkFiles}
    )

    add_test(NAME ${CODE_COVERAGE} COMMAND $<TARGET_FILE:${CODE_COVERAGE}>)
endfunction()




