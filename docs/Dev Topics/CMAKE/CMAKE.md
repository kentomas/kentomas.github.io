# CMAKE

## Overview

CMake is a cross-platform, open-source build system generator. It is used to control the software compilation process using simple platform and compiler independent configuration files, and generate native build scripts that can be used in the compiler environment of your choice.

## General Notes

1. You need to include every `*.cpp` file.
2. You don't need to include `*.h`\\`*.hpp` files.
3. 

## Samples

### Basic Sample

This file specifies a project named example with a single executable target example built from main.cpp. The C++ standard version is set to 11 and the required flag is set to True, meaning the project requires a C++11 compatible compiler. The target is linked against the library some_library.

```cpp title="CMakeLists.txt"
cmake_minimum_required(VERSION 3.10)
project(example)

# Add an executable target
add_executable(example main.cpp)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Link libraries to the target
target_link_libraries(example PRIVATE some_library)
```

### Multiple cpp files

```cpp title="CMakeLists.txt"
cmake_minimum_required(VERSION 3.10)
project(example)

# Collect all the source files in the current directory
file(GLOB SOURCE_FILES *.cpp)

# Add an executable target
add_executable(example ${SOURCE_FILES})

# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Link libraries to the target
target_link_libraries(example PRIVATE some_library)
```

### Multiple Libraries

```cpp title="CMakeLists.txt"
cmake_minimum_required(VERSION 3.10)
project(example)

# Collect all the source files in the current directory
file(GLOB SOURCE_FILES *.cpp)

# Add an executable target
add_executable(example ${SOURCE_FILES})

# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Link libraries to the target
target_link_libraries(example PRIVATE some_library)
target_link_libraries(example PRIVATE library1 library2)
target_link_libraries(example PRIVATE /path/to/library1 /path/to/library2)
```

### Complex CMAKE

This file sets the C++ standard to version 11 and the required flag to True, and sets the build type to Release if it's not specified. It includes the headers in the include directory, defines a library target example_lib and an executable target example, and links the library to the executable target. The file also finds and links the Boost library using the find_package command, sets compiler options for GCC, and installs the targets to the specified directories. The file also defines a custom target for test execution and an executable target for the tests.

```cpp title="CMakeLists.txt"
cmake_minimum_required(VERSION 3.10)
project(example)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Set the build type to Release if not specified
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

# Include headers in the project
include_directories(include)

# Collect all the source files in the current directory
file(GLOB_RECURSE SOURCE_FILES *.cpp)

# Define a library target
add_library(example_lib ${SOURCE_FILES})

# Define an executable target
add_executable(example main.cpp)

# Link the library to the executable target
target_link_libraries(example PRIVATE example_lib)

# Find and link required libraries
find_package(Boost REQUIRED)
include_directories(${Boost_INCLUDE_DIRS})
target_link_libraries(example PRIVATE ${Boost_LIBRARIES})

# Set compiler options
if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
  target_compile_options(example PRIVATE -Wall -Wextra)
endif()

# Install targets
install(TARGETS example example_lib
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib/static)

# Add a custom target for test execution
add_custom_target(test
  COMMAND example_test
  DEPENDS example_test)

# Add a test executable target
add_executable(example_test test/example_test.cpp)
target_link_libraries(example_test PRIVATE example_lib)
```

## References

- <https://cmake.org/cmake/help/latest/guide/tutorial/index.html>
