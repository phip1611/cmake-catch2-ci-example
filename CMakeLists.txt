cmake_minimum_required(VERSION 3.21)

project(cmake-catch2-ci-example CXX C ASM)

# Must be set before including CTest so that these arguments are applied when
# running `$ ninja test` or `$ make test`.
set(CMAKE_CTEST_ARGUMENTS "--output-on-failure" "--output-junit" "junit.xml")
# This must be in the top-level CMakeLists.txt to enable CMake/CTest support.
include(CTest)

set(CMAKE_CXX_STANDARD 23)

add_subdirectory(src/lib/foo)

if(BUILD_TESTING)
  add_subdirectory(src/tests)
endif()
