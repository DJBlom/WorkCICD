include(ProjectFiles)

set(${PROJECT_NAME}TestSourceFiles
    ${CMAKE_SOURCE_DIR}/test/OrionTests.cpp
    ${CMAKE_SOURCE_DIR}/test/tests/template_test.cpp
)

set(${PROJECT_NAME}TestHeaderFiles
    $ENV{CPPUTEST_HOME}/include
    ${CMAKE_SOURCE_DIR}/test/mocks
)

set(${PROJECT_NAME}TestLinkFiles
    $ENV{CPPUTEST_HOME}/lib/libCppUTest.a
    $ENV{CPPUTEST_HOME}/lib/libCppUTestExt.a
)
