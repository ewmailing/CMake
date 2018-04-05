# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.


set(CMAKE_Swift_OUTPUT_EXTENSION .o)
set(CMAKE_INCLUDE_FLAG_Swift "-I")

# Load compiler-specific information.
if(CMAKE_Swift_COMPILER_ID)
  include(Compiler/${CMAKE_Swift_COMPILER_ID}-Swift OPTIONAL)
endif()

# load the system- and compiler specific files
if(CMAKE_Swift_COMPILER_ID)
  # load a hardware specific file, mostly useful for embedded compilers
  if(CMAKE_SYSTEM_PROCESSOR)
    include(Platform/${CMAKE_SYSTEM_NAME}-${CMAKE_Swift_COMPILER_ID}-Swift-${CMAKE_SYSTEM_PROCESSOR} OPTIONAL)
  endif()
  include(Platform/${CMAKE_SYSTEM_NAME}-${CMAKE_Swift_COMPILER_ID}-Swift OPTIONAL)
else()

  include(Platform/${CMAKE_SYSTEM_NAME}-unknown-Swift OPTIONAL)
endif()




# Create a set of shared library variable specific to C++
# For 90% of the systems, these are the same flags as the C versions
# so if these are not set just copy the flags from the c version
if(NOT CMAKE_SHARED_LIBRARY_CREATE_Swift_FLAGS)
#  set(CMAKE_SHARED_LIBRARY_CREATE_Swift_FLAGS ${CMAKE_SHARED_LIBRARY_CREATE_C_FLAGS})
endif()

if(NOT CMAKE_Swift_COMPILE_OPTIONS_PIC)
#  set(CMAKE_Swift_COMPILE_OPTIONS_PIC ${CMAKE_C_COMPILE_OPTIONS_PIC})
endif()

if(NOT CMAKE_Swift_COMPILE_OPTIONS_PIE)
#  set(CMAKE_Swift_COMPILE_OPTIONS_PIE ${CMAKE_C_COMPILE_OPTIONS_PIE})
endif()

if(NOT CMAKE_Swift_COMPILE_OPTIONS_DLL)
#  set(CMAKE_Swift_COMPILE_OPTIONS_DLL ${CMAKE_C_COMPILE_OPTIONS_DLL})
endif()

if(NOT CMAKE_SHARED_LIBRARY_Swift_FLAGS)
#  set(CMAKE_SHARED_LIBRARY_Swift_FLAGS ${CMAKE_SHARED_LIBRARY_C_FLAGS})
endif()

if(NOT DEFINED CMAKE_SHARED_LIBRARY_LINK_Swift_FLAGS)
#  set(CMAKE_SHARED_LIBRARY_LINK_Swift_FLAGS ${CMAKE_SHARED_LIBRARY_LINK_C_FLAGS})
endif()

if(NOT CMAKE_SHARED_LIBRARY_RUNTIME_Swift_FLAG)
#  set(CMAKE_SHARED_LIBRARY_RUNTIME_Swift_FLAG ${CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG})
endif()

if(NOT CMAKE_SHARED_LIBRARY_RUNTIME_Swift_FLAG_SEP)
  set(CMAKE_SHARED_LIBRARY_RUNTIME_Swift_FLAG_SEP ${CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG_SEP})
endif()

if(NOT CMAKE_SHARED_LIBRARY_RPATH_LINK_Swift_FLAG)
#  set(CMAKE_SHARED_LIBRARY_RPATH_LINK_Swift_FLAG ${CMAKE_SHARED_LIBRARY_RPATH_LINK_C_FLAG})
endif()

if(NOT DEFINED CMAKE_EXE_EXPORTS_Swift_FLAG)
#  set(CMAKE_EXE_EXPORTS_Swift_FLAG ${CMAKE_EXE_EXPORTS_C_FLAG})
endif()

if(NOT DEFINED CMAKE_SHARED_LIBRARY_SONAME_Swift_FLAG)
#  set(CMAKE_SHARED_LIBRARY_SONAME_Swift_FLAG ${CMAKE_SHARED_LIBRARY_SONAME_C_FLAG})
endif()

if(NOT CMAKE_EXECUTABLE_RUNTIME_Swift_FLAG)
#  set(CMAKE_EXECUTABLE_RUNTIME_Swift_FLAG ${CMAKE_SHARED_LIBRARY_RUNTIME_Swift_FLAG})
endif()

if(NOT CMAKE_EXECUTABLE_RUNTIME_Swift_FLAG_SEP)
#  set(CMAKE_EXECUTABLE_RUNTIME_Swift_FLAG_SEP ${CMAKE_SHARED_LIBRARY_RUNTIME_Swift_FLAG_SEP})
endif()

if(NOT CMAKE_EXECUTABLE_RPATH_LINK_Swift_FLAG)
#  set(CMAKE_EXECUTABLE_RPATH_LINK_Swift_FLAG ${CMAKE_SHARED_LIBRARY_RPATH_LINK_Swift_FLAG})
endif()

if(NOT DEFINED CMAKE_SHARED_LIBRARY_LINK_Swift_WITH_RUNTIME_PATH)
#  set(CMAKE_SHARED_LIBRARY_LINK_Swift_WITH_RUNTIME_PATH ${CMAKE_SHARED_LIBRARY_LINK_C_WITH_RUNTIME_PATH})
endif()

if(NOT CMAKE_INCLUDE_FLAG_Swift)
  set(CMAKE_INCLUDE_FLAG_Swift ${CMAKE_INCLUDE_FLAG_C})
endif()

if(NOT CMAKE_INCLUDE_FLAG_SEP_Swift)
#  set(CMAKE_INCLUDE_FLAG_SEP_Swift ${CMAKE_INCLUDE_FLAG_SEP_C})
endif()





# for most systems a module is the same as a shared library
# so unless the variable CMAKE_MODULE_EXISTS is set just
# copy the values from the LIBRARY variables
if(NOT CMAKE_MODULE_EXISTS)
  set(CMAKE_SHARED_MODULE_Swift_FLAGS ${CMAKE_SHARED_LIBRARY_Swift_FLAGS})
  set(CMAKE_SHARED_MODULE_CREATE_Swift_FLAGS ${CMAKE_SHARED_LIBRARY_CREATE_Swift_FLAGS})
endif()

set(CMAKE_Swift_FLAGS_INIT "$ENV{SWIFTFLAGS} ${CMAKE_Swift_FLAGS_INIT}")
# avoid just having a space as the initial value for the cache
if(CMAKE_Swift_FLAGS_INIT STREQUAL " ")
  set(CMAKE_Swift_FLAGS_INIT)
endif()
set (CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS_INIT}" CACHE STRING
     "Flags used by the compiler during all build types.")


if(NOT CMAKE_NOT_USING_CONFIG_FLAGS)
# default build type is none
  if(NOT CMAKE_NO_BUILD_TYPE)
    set (CMAKE_BUILD_TYPE ${CMAKE_BUILD_TYPE_INIT} CACHE STRING
      "Choose the type of build, options are: None(CMAKE_CXX_FLAGS or CMAKE_Swift_FLAGS used) Debug Release RelWithDebInfo MinSizeRel.")
  endif()
  set (CMAKE_Swift_FLAGS_DEBUG "${CMAKE_Swift_FLAGS_DEBUG_INIT}" CACHE STRING
    "Flags used by the compiler during debug builds.")
  set (CMAKE_Swift_FLAGS_MINSIZEREL "${CMAKE_Swift_FLAGS_MINSIZEREL_INIT}" CACHE STRING
    "Flags used by the compiler during release builds for minimum size.")
  set (CMAKE_Swift_FLAGS_RELEASE "${CMAKE_Swift_FLAGS_RELEASE_INIT}" CACHE STRING
    "Flags used by the compiler during release builds.")
  set (CMAKE_Swift_FLAGS_RELWITHDEBINFO "${CMAKE_Swift_FLAGS_RELWITHDEBINFO_INIT}" CACHE STRING
    "Flags used by the compiler during release builds with debug info.")
endif()

include(CMakeCommonLanguageInclude)




# now define the following rule variables

# CMAKE_Swift_CREATE_SHARED_LIBRARY
# CMAKE_Swift_CREATE_SHARED_MODULE
# CMAKE_Swift_COMPILE_OBJECT
# CMAKE_Swift_LINK_EXECUTABLE

# variables supplied by the generator at use time
# <TARGET>
# <TARGET_BASE> the target without the suffix
# <OBJECTS>
# <OBJECT>
# <LINK_LIBRARIES>
# <FLAGS>
# <LINK_FLAGS>

# C compiler information
# <CMAKE_Swift_COMPILER>
# <CMAKE_SHARED_LIBRARY_CREATE_Swift_FLAGS>
# <CMAKE_SHARED_MODULE_CREATE_Swift_FLAGS>
# <CMAKE_Swift_LINK_FLAGS>

# Static library tools
# <CMAKE_AR>
# <CMAKE_RANLIB>


# create a C shared library
if(NOT CMAKE_Swift_CREATE_SHARED_LIBRARY)
  set(CMAKE_Swift_CREATE_SHARED_LIBRARY
      "<CMAKE_Swift_COMPILER> <CMAKE_SHARED_LIBRARY_Swift_FLAGS> <LANGUAGE_COMPILE_FLAGS> <LINK_FLAGS> <CMAKE_SHARED_LIBRARY_CREATE_Swift_FLAGS> <SONAME_FLAG><TARGET_SONAME> -o <TARGET> <OBJECTS> <LINK_LIBRARIES>")
#  "<CMAKE_Swift_COMPILER> <CMAKE_SHARED_LIBRARY_C_FLAGS> <LANGUAGE_COMPILE_FLAGS> <LINK_FLAGS> <CMAKE_SHARED_LIBRARY_CREATE_C_FLAGS> <SONAME_FLAG><TARGET_SONAME> -o <TARGET> <OBJECTS> <LINK_LIBRARIES>")
endif()

# create a C shared module just copy the shared library rule
if(NOT CMAKE_Swift_CREATE_SHARED_MODULE)
  set(CMAKE_Swift_CREATE_SHARED_MODULE ${CMAKE_Swift_CREATE_SHARED_LIBRARY})
endif()

# Create a static archive incrementally for large object file counts.
# If CMAKE_Swift_CREATE_STATIC_LIBRARY is set it will override these.
if(NOT DEFINED CMAKE_Swift_ARCHIVE_CREATE)
  set(CMAKE_Swift_ARCHIVE_CREATE "<CMAKE_AR> qc <TARGET> <LINK_FLAGS> <OBJECTS>")
endif()
if(NOT DEFINED CMAKE_Swift_ARCHIVE_APPEND)
  set(CMAKE_Swift_ARCHIVE_APPEND "<CMAKE_AR> q  <TARGET> <LINK_FLAGS> <OBJECTS>")
endif()
if(NOT DEFINED CMAKE_Swift_ARCHIVE_FINISH)
  set(CMAKE_Swift_ARCHIVE_FINISH "<CMAKE_RANLIB> <TARGET>")
endif()

# compile a C file into an object file
if(NOT CMAKE_Swift_COMPILE_OBJECT)
  set(CMAKE_Swift_COMPILE_OBJECT
	  #	      "<CMAKE_Swift_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -o <OBJECT>   -c <SOURCE>")
	  #	  "<CMAKE_Swift_COMPILER> -frontend -c <DEFINES> <INCLUDES> <FLAGS> -primary-file <SOURCE> -o <OBJECT>   -c <SOURCE>")
	  #  	  "<CMAKE_Swift_COMPILER> -frontend -c <DEFINES> <INCLUDES> <FLAGS> -primary-file <SOURCE> -emit-module -module-name <TARGET> -o <OBJECT>")

	  #	  "<CMAKE_Swift_COMPILER> -frontend -c <DEFINES> <INCLUDES> <FLAGS> -primary-file <OBJECT> <OBJECTS> -emit-module -module-name <TARGET> -o <OBJECT>  -emit-module-path   -c <SOURCE>")
	  "<CMAKE_Swift_COMPILER> -frontend -c  <INCLUDES> <FLAGS> -primary-file <SOURCE> <Swift-SOURCES> <Swift-BRIDGING_HEADER> -emit-module -module-name <TARGET> -o <OBJECT>")
endif()


if(NOT CMAKE_Swift_LINK_EXECUTABLE)
  set(CMAKE_Swift_LINK_EXECUTABLE
    "<CMAKE_Swift_COMPILER>c <FLAGS> <CMAKE_Swift_LINK_FLAGS> <LINK_FLAGS> <OBJECTS>  -o <TARGET> <LINK_LIBRARIES>")
#    "<CMAKE_Swift_COMPILER> <FLAGS> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <OBJECTS>  -o <TARGET> <LINK_LIBRARIES>")
endif()

if(NOT CMAKE_EXECUTABLE_RUNTIME_Swift_FLAG)
	set(CMAKE_EXECUTABLE_RUNTIME_Swift_FLAG ${CMAKE_SHARED_LIBRARY_RUNTIME_Swift_FLAG})
	#set(CMAKE_EXECUTABLE_RUNTIME_Swift_FLAG ${CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG})
endif()

if(NOT CMAKE_EXECUTABLE_RUNTIME_Swift_FLAG_SEP)
	set(CMAKE_EXECUTABLE_RUNTIME_Swift_FLAG_SEP ${CMAKE_SHARED_LIBRARY_RUNTIME_Swift_FLAG_SEP})
#	set(CMAKE_EXECUTABLE_RUNTIME_Swift_FLAG_SEP ${CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG_SEP})
endif()

if(NOT CMAKE_EXECUTABLE_RPATH_LINK_Swift_FLAG)
	set(CMAKE_EXECUTABLE_RPATH_LINK_Swift_FLAG ${CMAKE_SHARED_LIBRARY_RPATH_LINK_Swift_FLAG})
#	set(CMAKE_EXECUTABLE_RPATH_LINK_Swift_FLAG ${CMAKE_SHARED_LIBRARY_RPATH_LINK_C_FLAG})
endif()

mark_as_advanced(
CMAKE_Swift_FLAGS
CMAKE_Swift_FLAGS_DEBUG
CMAKE_Swift_FLAGS_MINSIZEREL
CMAKE_Swift_FLAGS_RELEASE
CMAKE_Swift_FLAGS_RELWITHDEBINFO
)



set(CMAKE_Swift_INFORMATION_LOADED 1)
