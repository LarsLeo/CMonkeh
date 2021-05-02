cmake_minimum_required(VERSION 3.14)
project(CMonkeh CXX)
set(CMAKE_CXX_STANDARD 14)

### Source Code ---
file(GLOB_RECURSE SOURCE_FILES
    ${CMAKE_SOURCE_DIR}/src/*.c
    ${CMAKE_SOURCE_DIR}/src/*.cpp)
    
file(GLOB_RECURSE HEADER_FILES
    ${CMAKE_SOURCE_DIR}/src/*.h
    ${CMAKE_SOURCE_DIR}/src/*.hpp)
    
add_executable(${PROJECT_NAME} ${HEADER_FILES} ${SOURCE_FILES})

set(LIB_DIR "${CMAKE_CURRENT_SOURCE_DIR}/include")

### GLFW
set(GLFW_DIR "${LIB_DIR}/glfw")
set(GLFW_BUILD_EXAMPLES OFF CACHE INTERNAL "Build the GLFW example programs")
set(GLFW_BUILD_TESTS OFF CACHE INTERNAL "Build the GLFW test programs")
set(GLFW_BUILD_DOCS OFF CACHE INTERNAL "Build the GLFW documentation")
set(GLFW_INSTALL OFF CACHE INTERNAL "Generate installation target")
target_include_directories(${PROJECT_NAME} PRIVATE "${GLFW_DIR}/include")
target_compile_definitions(${PROJECT_NAME} PRIVATE "GLFW_INCLUDE_NONE")
add_subdirectory("${GLFW_DIR}")

### GLAD
set(GLAD_DIR "${LIB_DIR}/glad")
add_subdirectory("${GLAD_DIR}")
target_include_directories(${PROJECT_NAME} PRIVATE "${GLAD_DIR}/include")

set(LIBS glad glfw "${GLFW_LIBRARIES}" "${CMAKE_DL_LIBS}")

target_link_libraries(${PROJECT_NAME} ${LIBS})
