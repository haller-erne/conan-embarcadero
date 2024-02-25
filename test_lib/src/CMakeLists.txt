project(test_lib)
 
#set(SharedLibrary_headers SharedLibrary.h)
#set(SharedLibrary_sources SharedLibrary.cpp)
#add_library(SharedLibrary SHARED SharedLibrary.h SharedLibrary.cpp)
 
add_library(test_lib SHARED printhello.cpp)
add_compile_definitions(TESTLIB_SHARED TESTLIB_EXPORT)

target_include_directories(test_lib
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/../include
)
INSTALL (
    DIRECTORY ${CMAKE_SOURCE_DIR}/include/
    DESTINATION include
    FILES_MATCHING PATTERN "include/*/*.h*")
	
install(TARGETS test_lib
    RUNTIME DESTINATION lib
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)