add_executable(${PROJECT_NAME}_app app/main.cpp)
target_include_directories(${PROJECT_NAME}_app PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_link_libraries(${PROJECT_NAME}_app
        PRIVATE
        kronecker_project_options
        kronecker_project_warnings
        fmt::fmt
        spdlog::spdlog
        ${PROJECT_NAME})