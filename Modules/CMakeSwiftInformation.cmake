
#=============================================================================
# Copyright 2004-2011 Kitware, Inc.
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

# This should be included before the _INIT variables are
# used to initialize the cache.  Since the rule variables
# have if blocks on them, users can still define them here.
# But, it should still be after the platform file so changes can
# be made to those values.


# Create a set of shared library variable specific to C++
# For 90% of the systems, these are the same flags as the C versions
# so if these are not set just copy the flags from the c version
if(NOT CMAKE_SHARED_LIBRARY_CREATE_Swift_FLAGS)
  set(CMAKE_SHARED_LIBRARY_CREATE_Swift_FLAGS ${CMAKE_SHARED_LIBRARY_CREATE_C_FLAGS})
endif()

if(NOT CMAKE_Swift_COMPILE_OPTIONS_PIC)
  set(CMAKE_Swift_COMPILE_OPTIONS_PIC ${CMAKE_C_COMPILE_OPTIONS_PIC})
endif()

if(NOT CMAKE_Swift_COMPILE_OPTIONS_PIE)
  set(CMAKE_Swift_COMPILE_OPTIONS_PIE ${CMAKE_C_COMPILE_OPTIONS_PIE})
endif()

if(NOT CMAKE_Swift_COMPILE_OPTIONS_DLL)
  set(CMAKE_Swift_COMPILE_OPTIONS_DLL ${CMAKE_C_COMPILE_OPTIONS_DLL})
endif()

if(NOT CMAKE_SHARED_LIBRARY_Swift_FLAGS)
  set(CMAKE_SHARED_LIBRARY_Swift_FLAGS ${CMAKE_SHARED_LIBRARY_C_FLAGS})
endif()

if(NOT DEFINED CMAKE_SHARED_LIBRARY_LINK_Swift_FLAGS)
  set(CMAKE_SHARED_LIBRARY_LINK_Swift_FLAGS ${CMAKE_SHARED_LIBRARY_LINK_C_FLAGS})
endif()

if(NOT CMAKE_SHARED_LIBRARY_RUNTIME_Swift_FLAG)
  set(CMAKE_SHARED_LIBRARY_RUNTIME_Swift_FLAG ${CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG})
endif()

if(NOT CMAKE_SHARED_LIBRARY_RUNTIME_Swift_FLAG_SEP)
  set(CMAKE_SHARED_LIBRARY_RUNTIME_Swift_FLAG_SEP ${CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG_SEP})
endif()

if(NOT CMAKE_SHARED_LIBRARY_RPATH_LINK_Swift_FLAG)
  set(CMAKE_SHARED_LIBRARY_RPATH_LINK_Swift_FLAG ${CMAKE_SHARED_LIBRARY_RPATH_LINK_C_FLAG})
endif()

if(NOT DEFINED CMAKE_EXE_EXPORTS_Swift_FLAG)
  set(CMAKE_EXE_EXPORTS_Swift_FLAG ${CMAKE_EXE_EXPORTS_C_FLAG})
endif()

if(NOT DEFINED CMAKE_SHARED_LIBRARY_SONAME_Swift_FLAG)
  set(CMAKE_SHARED_LIBRARY_SONAME_Swift_FLAG ${CMAKE_SHARED_LIBRARY_SONAME_C_FLAG})
endif()

if(NOT CMAKE_EXECUTABLE_RUNTIME_Swift_FLAG)
  set(CMAKE_EXECUTABLE_RUNTIME_Swift_FLAG ${CMAKE_SHARED_LIBRARY_RUNTIME_Swift_FLAG})
endif()

if(NOT CMAKE_EXECUTABLE_RUNTIME_Swift_FLAG_SEP)
  set(CMAKE_EXECUTABLE_RUNTIME_Swift_FLAG_SEP ${CMAKE_SHARED_LIBRARY_RUNTIME_Swift_FLAG_SEP})
endif()

if(NOT CMAKE_EXECUTABLE_RPATH_LINK_Swift_FLAG)
  set(CMAKE_EXECUTABLE_RPATH_LINK_Swift_FLAG ${CMAKE_SHARED_LIBRARY_RPATH_LINK_Swift_FLAG})
endif()

if(NOT DEFINED CMAKE_SHARED_LIBRARY_LINK_Swift_WITH_RUNTIME_PATH)
  set(CMAKE_SHARED_LIBRARY_LINK_Swift_WITH_RUNTIME_PATH ${CMAKE_SHARED_LIBRARY_LINK_C_WITH_RUNTIME_PATH})
endif()

if(NOT CMAKE_INCLUDE_FLAG_Swift)
  set(CMAKE_INCLUDE_FLAG_Swift ${CMAKE_INCLUDE_FLAG_C})
endif()

if(NOT CMAKE_INCLUDE_FLAG_SEP_Swift)
  set(CMAKE_INCLUDE_FLAG_SEP_Swift ${CMAKE_INCLUDE_FLAG_SEP_C})
endif()

