function(package_add_test TESTNAME)
    cmake_parse_arguments(ARGS "${options}" "" "SOURCES;DEPENDS" ${ARGN})
    project_options(
            PREFIX "kronecker_test"
            ENABLE_CACHE
            ${ENABLE_CPPCHECK}
            ${ENABLE_CLANG_TIDY}
            WARNINGS_AS_ERRORS
    )
    add_executable(${TESTNAME} ${ARGS_SOURCES})
    target_link_libraries(${TESTNAME}
            PRIVATE kronecker_test_project_options kronecker_test_project_warnings
    )
    target_include_directories(${TESTNAME} PUBLIC ${CMAKE_SOURCE_DIR}/include)
    find_and_link_libs(${TESTNAME})
    gtest_discover_tests(${TESTNAME}
            WORKING_DIRECTORY ${PROJECT_DIR}
            PROPERTIES VS_DEBUGGER_WORKING_DIRECTORY "${PROJECT_DIR}"
    )
endfunction()

function(find_and_link_libs TARGET_NAME)
    target_find_dependencies(${TARGET_NAME}
            PRIVATE_CONFIG
            fmt
            spdlog
            GTest
    )

    target_link_system_libraries(${TARGET_NAME}
            PRIVATE
            fmt::fmt
            spdlog::spdlog
            gtest::gtest
    )
endfunction()