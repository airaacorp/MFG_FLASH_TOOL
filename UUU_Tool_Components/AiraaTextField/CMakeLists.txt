cmake_minimum_required(VERSION 3.16)

project(AiraaTextField VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Core)

qt_standard_project_setup()

qt_add_library(${PROJECT_NAME}Plugin SHARED)

qt_add_qml_module(${PROJECT_NAME}Plugin
    URI ${PROJECT_NAME}Plugin
    VERSION 1.0
    RESOURCE_PREFIX /
    PLUGIN_TARGET ${PROJECT_NAME}Plugin
    QML_FILES AiraaTextField.qml
)

set_target_properties(${PROJECT_NAME}Plugin PROPERTIES
  LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/BuildOutput/${PROJECT_NAME}Plugin
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(${PROJECT_NAME}Plugin PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appuntitled18
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(${PROJECT_NAME}Plugin
    PRIVATE Qt6::Quick Qt6::Core
)

include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME}Plugin
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

add_custom_command(
    OUTPUT "${CMAKE_SOURCE_DIR}/BuildOutput/${PROJECT_NAME}Plugin/qmldir"
    COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_BINARY_DIR}/UUU_Tool_Components/${PROJECT_NAME}/qmldir" "${CMAKE_SOURCE_DIR}/BuildOutput/${PROJECT_NAME}Plugin/qmldir"
    DEPENDS "${CMAKE_BINARY_DIR}/UUU_Tool_Components/${PROJECT_NAME}/qmldir"
    COMMENT "Copy qmldir"
)

add_custom_target(${PROJECT_NAME}_copy_qmldir_file ALL
    DEPENDS "${CMAKE_BINARY_DIR}/UUU_Tool_Components/${PROJECT_NAME}/qmldir"
)

add_dependencies(${PROJECT_NAME}Plugin ${PROJECT_NAME}_copy_qmldir_file)
