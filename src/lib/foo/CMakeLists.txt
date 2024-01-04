add_library(foo STATIC src/foo.cpp)

target_include_directories(foo
        PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

install(TARGETS foo
        EXPORT fooConfig
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION include
)

install(DIRECTORY include/ DESTINATION include)
install(EXPORT fooConfig DESTINATION share/foo/cmake)
export(TARGETS foo FILE fooConfig.cmake)
