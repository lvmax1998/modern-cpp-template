set(sources
    src/tmp.cpp
)

set(exe_sources
		src/main.cpp
		${sources}
)

set(headers
    include/project/tmp.hpp
)

set(test_sources
  src/tmp_test.cpp
)

source_group("Header Files" FILES ${headers})
source_group("Source Files" FILES ${sources})
source_group("Test Files" FILES ${test_sources})

string(TIMESTAMP PROJECT_BUILD_DATE "%Y%m%d")
if(WIN32)
  configure_file(
    ${CMAKE_SOURCE_DIR}/res/info.rc.in
    ${CMAKE_SOURCE_DIR}/res/info.rc
  )

  list(APPEND sources ${CMAKE_SOURCE_DIR}/res/info.rc)
endif(WIN32)