
#=============================================================================
# Copyright 2002-2009 Kitware, Inc.
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)

# determine the compiler to use for C programs
# NOTE, a generator may set CMAKE_SWIFT_COMPILER before
# loading this file to force a compiler.
# use environment variable CC first if defined by user, next use
# the cmake variable CMAKE_GENERATOR_CC which can be defined by a generator
# as a default compiler
# If the internal cmake variable _CMAKE_TOOLCHAIN_PREFIX is set, this is used
# as prefix for the tools (e.g. arm-elf-gcc, arm-elf-ar etc.). This works
# currently with the GNU crosscompilers.
#
# Sets the following variables:
#   CMAKE_SWIFT_COMPILER
#   CMAKE_AR
#   CMAKE_RANLIB
#   CMAKE_COMPILER_IS_GNUCC
#
# If not already set before, it also sets
#   _CMAKE_TOOLCHAIN_PREFIX

MESSAGE("starting CMakeDetermineSwiftCompiler.cmake")

#include(${CMAKE_ROOT}/Modules/CMakeDetermineCompiler.cmake)


if(NOT CMAKE_Swift_COMPILER)

if(${CMAKE_GENERATOR} MATCHES "Visual Studio")
elseif("${CMAKE_GENERATOR}" MATCHES "Xcode")
  set(CMAKE_SWIFT_COMPILER_XCODE_TYPE sourcecode.swift)
  #_cmake_find_compiler_path(Swift)
  _cmake_find_compiler_path(C)
MESSAGE("CMakeDetermineSwiftCompiler.cmake _cmake_find_compiler_path")

#set(CMAKE_Swift_COMPILER ${CMAKE_C_COMPILER} CACHE PATH "Swift Compiler")
  if(CMAKE_Swift_COMPILER_INIT)
    set(CMAKE_Swift_COMPILER ${CMAKE_Swift_COMPILER_INIT} CACHE PATH "Swift Compiler")
  else()
    find_program(CMAKE_Swift_COMPILER
      NAMES swiftc 
      PATHS ${Swift_BIN_PATH}
    )
  endif()

  # if no runtime has been specified yet, then look for one
  if(CMAKE_Swift_RUNTIME_INIT)
    set(CMAKE_Swift_RUNTIME ${CMAKE_Swift_RUNTIME_INIT} CACHE PATH "Swift Compiler")
  else()
    find_program(CMAKE_Swift_RUNTIME
      NAMES swift
      PATHS ${Swift_BIN_PATH}
    )
  endif()

  
else()
  # if no compiler has been specified yet, then look for one
  if(CMAKE_Swift_COMPILER_INIT)
    set(CMAKE_Swift_COMPILER ${CMAKE_Swift_COMPILER_INIT} CACHE PATH "Swift Compiler")
  else()
    find_program(CMAKE_Swift_COMPILER
      NAMES swiftc 
      PATHS ${Swift_BIN_PATH}
    )
  endif()

  # if no runtime has been specified yet, then look for one
  if(CMAKE_Swift_RUNTIME_INIT)
    set(CMAKE_Swift_RUNTIME ${CMAKE_Swift_RUNTIME_INIT} CACHE PATH "Swift Compiler")
  else()
    find_program(CMAKE_Swift_RUNTIME
      NAMES swift
      PATHS ${Swift_BIN_PATH}
    )
  endif()
endif()
endif()



# configure variables set in this file for fast reload later on
configure_file(${CMAKE_ROOT}/Modules/CMakeSwiftCompiler.cmake.in
  ${CMAKE_PLATFORM_INFO_DIR}/CMakeSwiftCompiler.cmake
  @ONLY
  )
set(CMAKE_SWIFT_COMPILER_ENV_VAR "SWIFT_COMPILER")
