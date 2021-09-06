age_add_target(
    NAME AgeEngine
    STATIC
    FILES_CMAKE
        Files.cmake

    INCLUDE_DIRECTORIES
        PUBLIC 
            ${CMAKE_CURRENT_SOURCE_DIR}/Public
        PRIVATE 
            ${CMAKE_CURRENT_SOURCE_DIR}/Private
        INTERFACE
            ${CMAKE_CURRENT_SOURCE_DIR}/Interface
)