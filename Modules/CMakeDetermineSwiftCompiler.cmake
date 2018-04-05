# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.


include(${CMAKE_ROOT}/Modules/CMakeDetermineCompiler.cmake)

if("${CMAKE_GENERATOR}" STREQUAL "Xcode")
  if(XCODE_VERSION VERSION_LESS 6.1)
    message(FATAL_ERROR "Swift language not supported by Xcode ${XCODE_VERSION}")
  endif()
  set(CMAKE_Swift_COMPILER_XCODE_TYPE sourcecode.swift)
  _cmake_find_compiler_path(Swift)
else()
	#  message(FATAL_ERROR "Swift language not supported by \"${CMAKE_GENERATOR}\" generator")

  if(NOT CMAKE_Swift_COMPILER)
    set(CMAKE_Swift_COMPILER_INIT NOTFOUND)

    # prefer the environment variable CC
	if(NOT $ENV{SWIFTC} STREQUAL "")
      get_filename_component(CMAKE_Swift_COMPILER_INIT $ENV{SWIFTC} PROGRAM PROGRAM_ARGS CMAKE_Swift_FLAGS_ENV_INIT)
      if(CMAKE_Swift_FLAGS_ENV_INIT)
        set(CMAKE_Swift_COMPILER_ARG1 "${CMAKE_Swift_FLAGS_ENV_INIT}" CACHE STRING "First argument to C compiler")
      endif()
      if(NOT EXISTS ${CMAKE_Swift_COMPILER_INIT})
        message(FATAL_ERROR "Could not find compiler set in environment variable CC:\n$ENV{SWIFTC}.")
      endif()
    endif()

    # next try prefer the compiler specified by the generator
	if(CMAKE_GENERATOR_SWIFTC)
      if(NOT CMAKE_Swift_COMPILER_INIT)
        set(CMAKE_Swift_COMPILER_INIT ${CMAKE_GENERATOR_SWIFTC})
      endif()
    endif()

    # finally list compilers to try
    if(NOT CMAKE_Swift_COMPILER_INIT)
		#		set(CMAKE_Swift_COMPILER_LIST swiftc)
		      set(CMAKE_Swift_COMPILER_LIST swift)
    endif()

	  MESSAGE("_cmake_find_compiler")
	_cmake_find_compiler(Swift)

  else()
	  MESSAGE("_cmake_find_compiler_path")
    _cmake_find_compiler_path(Swift)
  endif()
  mark_as_advanced(CMAKE_Swift_COMPILER)






endif()

# Build a small source file to identify the compiler.
if(NOT CMAKE_Swift_COMPILER_ID_RUN)
  set(CMAKE_Swift_COMPILER_ID_RUN 1)

  list(APPEND CMAKE_Swift_COMPILER_ID_MATCH_VENDORS Apple)
  set(CMAKE_Swift_COMPILER_ID_MATCH_VENDOR_REGEX_Apple "com.apple.xcode.tools.swift.compiler")

  set(CMAKE_Swift_COMPILER_ID_TOOL_MATCH_REGEX "\nCompileSwiftSources[^\n]*(\n[ \t]+[^\n]*)*\n[ \t]+([^ \t\r\n]+)[^\r\n]* -c[^\r\n]*CompilerIdSwift/CompilerId/main.swift")
  set(CMAKE_Swift_COMPILER_ID_TOOL_MATCH_INDEX 2)

  # Try to identify the compiler.
  set(CMAKE_Swift_COMPILER_ID)
  include(${CMAKE_ROOT}/Modules/CMakeDetermineCompilerId.cmake)
  CMAKE_DETERMINE_COMPILER_ID(Swift "" CompilerId/main.swift)
endif()

if (NOT _CMAKE_TOOLCHAIN_LOCATION)
  get_filename_component(_CMAKE_TOOLCHAIN_LOCATION "${CMAKE_Swift_COMPILER}" PATH)
endif ()

set(_CMAKE_PROCESSING_LANGUAGE "Swift")
include(CMakeFindBinUtils)
unset(_CMAKE_PROCESSING_LANGUAGE)

# configure variables set in this file for fast reload later on
configure_file(${CMAKE_ROOT}/Modules/CMakeSwiftCompiler.cmake.in
  ${CMAKE_PLATFORM_INFO_DIR}/CMakeSwiftCompiler.cmake
  @ONLY
  )

set(CMAKE_Swift_COMPILER_ENV_VAR "SWIFTC")

