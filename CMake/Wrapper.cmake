function(age_add_target)
    
    set(options STATIC SHARED MODULE HEADERONLY EXECUTABLE)
    set(oneValueArgs NAME NAMESPACE OUTPUT_SUBDIRECTORY OUTPUT_NAME)
    set(multiValueArgs FILES_CMAKE GENERATED_FILES INCLUDE_DIRECTORIES COMPILE_DEFINITIONS BUILD_DEPENDENCIES RUNTIME_DEPENDENCIES PLATFORM_INCLUDE_FILES TARGET_PROPERTIES AUTOGEN_RULES)
    
    cmake_parse_arguments(age_add_target "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
    
    unset(Files)
    include(${age_add_target_FILES_CMAKE})
   
    foreach(File ${Files})
        list(APPEND SOURCE_FILES_LIST ${CMAKE_CURRENT_SOURCE_DIR}/${File})
    endforeach()
   
    if(age_add_target_EXECUTABLE)
        message("building an executable")
    elseif(age_add_target_HEADERONLY)
        message("building a header only")
    elseif(age_add_target_STATIC)
        message("building a static")
        add_library(${age_add_target_NAME} STATIC ${SOURCE_FILES_LIST})
    elseif(age_add_target_SHARED)
        message("building a shared")
    elseif(age_add_target_MODULE)
        message("building a module")
    else()
        message(ERROR_STATUS "target type is must be specified")
    endif()
    
    if(age_add_target_INCLUDE_DIRECTORIES)
        target_include_directories(${age_add_target_NAME} ${age_add_target_INCLUDE_DIRECTORIES})
    endif()
    
    if(age_add_target_BUILD_DEPENDENCIES)
        target_link_libraries(${age_add_target_NAME} ${age_add_target_BUILD_DEPENDENCIES})
    endif()

endfunction(age_add_target)
