cmake_minimum_required(VERSION 3.23)

#
# Project details
#

project(
  ${CMAKE_PROJECT_NAME}Benchmarks
  LANGUAGES CXX
)

find_package(benchmark REQUIRED)

verbose_message("Adding benchmarks under ${CMAKE_PROJECT_NAME}Benchmarks...")
foreach(file ${benchmark_sources})
  string(REGEX REPLACE "(.*/)([a-zA-Z0-9_ ]+)_benchmark(\\.cpp)" "\\2" benchmark_name ${file})
  add_executable(${benchmark_name}_Benchmark ${file})

  #
  # Set the compiler standard
  #

  target_compile_features(${benchmark_name}_Benchmark PUBLIC cxx_std_17)
  

  if(${CMAKE_PROJECT_NAME}_BUILD_EXECUTABLE)
    set(${CMAKE_PROJECT_NAME}_Benchmark_LIB ${CMAKE_PROJECT_NAME}_LIB)
  else()
    set(${CMAKE_PROJECT_NAME}_Benchmark_LIB ${CMAKE_PROJECT_NAME})
  endif()

  target_link_libraries(${benchmark_name}_Benchmark PRIVATE ${${CMAKE_PROJECT_NAME}_Benchmark_LIB} benchmark::benchmark)

  if(BUILD_SHARED_LIBS AND WIN32)
    add_custom_command(TARGET ${benchmark_name}_Benchmark POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy_if_different
          $<TARGET_FILE:${CMAKE_PROJECT_NAME}>
          $<TARGET_FILE_DIR:${benchmark_name}_Benchmark>
    )
  endif()

endforeach()

verbose_message("Finished adding benchmarks under ${CMAKE_PROJECT_NAME}Benchmarks.")