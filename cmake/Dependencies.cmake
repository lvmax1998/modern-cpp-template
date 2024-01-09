# find_package(OpenCV REQUIRED)

# set(DEPENDENCY_LIBS opencv_core)

target_link_libraries(
 ${PROJECT_NAME}
 PUBLIC
  ${DEPENDENCY_LIBS}
)
if(${PROJECT_NAME}_BUILD_EXECUTABLE AND ${PROJECT_NAME}_ENABLE_UNIT_TESTING)
 target_link_libraries(
   ${PROJECT_NAME}_LIB
   PUBLIC
    ${DEPENDENCY_LIBS}
 )
endif()