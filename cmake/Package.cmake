#####################################
# Cpack Settings
#####################################
set(CPACK_GENERATOR "ZIP")

# version information
set(CPACK_PACKAGE_VERSION_MAJOR "${PROJECT_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${PROJECT_VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH "${PROJECT_VERSION_PATCH}")

# set package name
set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")

# install project
set(CPACK_INSTALL_CMAKE_PROJECTS "${CMAKE_BINARY_DIR};${PROJECT_NAME};ALL;/")

include(CPack)