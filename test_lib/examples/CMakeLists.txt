project(test_project)

add_executable(test_main test_main.cpp)

target_link_libraries(test_main
    PRIVATE
    test_lib
)