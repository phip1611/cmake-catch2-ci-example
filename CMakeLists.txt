cmake_minimum_required(VERSION 3.21)

project(cmake-catch2-ci-example CXX C ASM)

# This must be in the top-level CMakeLists.txt to enable CMake/CTest support.
include(CTest)

set(CMAKE_CXX_STANDARD 23)

add_subdirectory(src/lib/foo)

if(BUILD_TESTING)
  add_subdirectory(src/tests)
endif()
