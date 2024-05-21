cmake_minimum_required(VERSION 3.16)

project(UUU_Tool VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Core Gui SerialPort QuickControls2)

qt_standard_project_setup()

add_subdirectory(UUU_Tool_Components/AiraaTextField)
add_subdirectory(UUU_Tool_Components/AiraaButton)
add_subdirectory(UUU_Tool_Components/AiraaComboBox)

list(APPEND project_Qml_files
	main.qml
        Settingspage.qml
        Flashcmd.qml
        Communication/Communication.qml
        Productinfo.qml
        About.qml
)

list(APPEND project_Source_files
	SerialCommunication.cpp
        commandLauncher.cpp
        data.cpp
        main.cpp
        serialportinfoviewer.cpp
)

list(APPEND project_Resources_files
    Image/Search.png
    Image/QuestionMark.png
    Image/Downarrow.png
    Image/flash1.png
    Image/Airaa_Logo.png
    Image/add.png
    Image/clear.png
    Image/maxid.png
    Image/closeid.png
    Image/minid.png
    Image/close.png
    Image/close3.png
    Image/tick_icon.png
    Image/Close_red.png
    Image/3.png
    Image/2.png
    Image/1.png
    Image/BackButton.png
)

qt_add_executable(app_UUU_Tool
    main.cpp
)

qt_add_qml_module(app_UUU_Tool
    URI UUU_Tool
    VERSION 1.0
    QML_FILES ${project_Qml_files}
    SOURCES ${project_Source_files}
    RESOURCES ${project_Resources_files}
    RESOURCES Image/AcL2.png
    RESOURCES Image/closeIcon.png
    RESOURCES Image/maximize.png
    RESOURCES Image/maximize.png
    RESOURCES
    RESOURCES Image/minimize.png
)

set_target_properties(app_UUU_Tool PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/BuildOutput)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(app_UUU_Tool PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appuntitled18
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(app_UUU_Tool
    PRIVATE Qt6::Quick Qt6::Gui Qt6::Core Qt6::QuickControls2 Qt6::SerialPort
)

include(GNUInstallDirs)
install(TARGETS app_UUU_Tool
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
