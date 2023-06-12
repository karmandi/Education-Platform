include(Compiler/Clang)
__compiler_clang(CXX)

set(CMAKE_CXX_COMPILE_OPTIONS_EXPLICIT_LANGUAGE -x c++)

if(NOT "x${CMAKE_CXX_SIMULATE_ID}" STREQUAL "xMSVC")
  if((NOT DEFINED CMAKE_DEPENDS_USE_COMPILER OR CMAKE_DEPENDS_USE_COMPILER)
      AND CMAKE_GENERATOR MATCHES "Makefiles"
      AND CMAKE_DEPFILE_FLAGS_CXX)
    # dependencies are computed by the compiler itself
    set(CMAKE_CXX_DEPFILE_FORMAT gcc)
    set(CMAKE_CXX_DEPENDS_USE_COMPILER TRUE)
  endif()

  set(CMAKE_CXX_COMPILE_OPTIONS_VISIBILITY_INLINES_HIDDEN "-fvisibility-inlines-hidden")
endif()

if(NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS 4.0)
  set(CMAKE_CXX98_STANDARD_COMPILE_OPTION "-std=c++98")
  set(CMAKE_CXX98_EXTENSION_COMPILE_OPTION "-std=gnu++98")
  set(CMAKE_CXX98_STANDARD__HAS_FULL_SUPPORT ON)

  set(CMAKE_CXX11_STANDARD_COMPILE_OPTION "-std=c++11")
  set(CMAKE_CXX11_EXTENSION_COMPILE_OPTION "-std=gnu++11")
endif()

if(NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS 6.1)
  set(CMAKE_CXX14_STANDARD_COMPILE_OPTION "-std=c++14")
  set(CMAKE_CXX14_EXTENSION_COMPILE_OPTION "-std=gnu++14")
  set(CMAKE_CXX14_STANDARD__HAS_FULL_SUPPORT ON)
elseif(NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS 5.1)
  # AppleClang 5.0 knows this flag, but does not set a __cplusplus macro greater than 201103L
  set(CMAKE_CXX14_STANDARD_COMPILE_OPTION "-std=c++1y")
  set(CMAKE_CXX14_EXTENSION_COMPILE_OPTION "-std=gnu++1y")
  set(CMAKE_CXX14_STANDARD__HAS_FULL_SUPPORT ON)
endif()

if (NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS 10.0)
  set(CMAKE_CXX17_STANDARD_COMPILE_OPTION "-std=c++17")
  set(CMAKE_CXX17_EXTENSION_COMPILE_OPTION "-std=gnu++17")
elseif (NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS 6.1)
  set(CMAKE_CXX17_STANDARD_COMPILE_OPTION "-std=c++1z")
  set(CMAKE_CXX17_EXTENSION_COMPILE_OPTION "-std=gnu++1z")
endif()

if (NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS 8.0)
    set(CMAKE_CXX11_STANDARD__HAS_FULL_SUPPORT ON)
endif()

if (NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS 13.0)
  set(CMAKE_CXX20_STANDARD_COMPILE_OPTION "-std=c++20")
  set(CMAKE_CXX20_EXTENSION_COMPILE_OPTION "-std=gnu++20")
elseif (NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS 10.0)
  set(CMAKE_CXX20_STANDARD_COMPILE_OPTION "-std=c++2a")
  set(CMAKE_CXX20_EXTENSION_COMPILE_OPTION "-std=gnu++2a")
endif()

if (NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS 13.0)
  set(CMAKE_CXX23_STANDARD_COMPILE_OPTION "-std=c++2b")
  set(CMAKE_CXX23_EXTENSION_COMPILE_OPTION "-std=gnu++2b")
endif()

__compiler_check_default_language_standard(CXX 4.0 98)
