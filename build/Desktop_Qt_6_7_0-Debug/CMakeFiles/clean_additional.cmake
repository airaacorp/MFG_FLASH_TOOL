# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/app_UUU_Tool_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/app_UUU_Tool_autogen.dir/ParseCache.txt"
  "UUU_Tool_Components/AiraaButton/AiraaButtonPlugin_autogen"
  "UUU_Tool_Components/AiraaButton/CMakeFiles/AiraaButtonPlugin_autogen.dir/AutogenUsed.txt"
  "UUU_Tool_Components/AiraaButton/CMakeFiles/AiraaButtonPlugin_autogen.dir/ParseCache.txt"
  "UUU_Tool_Components/AiraaComboBox/AiraaComboBoxPlugin_autogen"
  "UUU_Tool_Components/AiraaComboBox/CMakeFiles/AiraaComboBoxPlugin_autogen.dir/AutogenUsed.txt"
  "UUU_Tool_Components/AiraaComboBox/CMakeFiles/AiraaComboBoxPlugin_autogen.dir/ParseCache.txt"
  "UUU_Tool_Components/AiraaTextField/AiraaTextFieldPlugin_autogen"
  "UUU_Tool_Components/AiraaTextField/CMakeFiles/AiraaTextFieldPlugin_autogen.dir/AutogenUsed.txt"
  "UUU_Tool_Components/AiraaTextField/CMakeFiles/AiraaTextFieldPlugin_autogen.dir/ParseCache.txt"
  "app_UUU_Tool_autogen"
  )
endif()
