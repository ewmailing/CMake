#set(CMAKE_SHARED_LIBRARY_CREATE_Swift_FLAGS "-Wl,-shared")
set(CMAKE_SHARED_LIBRARY_RUNTIME_Swift_FLAG "-Xlinker -rpath -Xlinker ")
set(CMAKE_SHARED_LIBRARY_RUNTIME_Swift_FLAG_SEP ":")
set(CMAKE_SHARED_LIBRARY_RPATH_LINK_Swift_FLAG "-Xlinker -rpath-link -Xlinker ")
set(CMAKE_SHARED_LIBRARY_SONAME_Swift_FLAG "-Xlinker -soname -Xlinker ")
message("in Linux-unknown-Swift.cmake")
