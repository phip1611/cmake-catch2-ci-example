find_package(Catch2 3 REQUIRED)

add_executable(unit-tests_combined unit/lib/foo.cpp)

# Test framework dependencies.
target_link_libraries(unit-tests_combined PRIVATE Catch2::Catch2WithMain)

# Functionality to test.
target_link_libraries(unit-tests_combined PRIVATE foo)

add_test(NAME unit-tests COMMAND unit-tests_combined)
