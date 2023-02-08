project(Orion)
include(ProjectTestFiles)

find_program(GCOV gcov)
if(DEFINED ENV{CPPUTEST_HOME} AND GCOV AND BUILD_COVERAGE)
    include(CodeCoverage)
    CodeCoverage()
endif()


















