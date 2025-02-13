add_executable(${PROJECT_NAME}_app app/main.cpp)
set_property(TARGET ${PROJECT_NAME}_app PROPERTY exclude_from_default TRUE)
target_include_directories(${PROJECT_NAME}_app PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_link_libraries(${PROJECT_NAME}_app PRIVATE kronecker_project_options kronecker_project_warnings ${PROJECT_NAME})