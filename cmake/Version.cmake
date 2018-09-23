# Set SWIPL_VERSION_MAJOR, SWIPL_VERSION_MINOR and SWIPL_VERSION_PATCH
# from the VERSION file in the project root

if(NOT SWIPL_VERSION_STRING)
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/VERSION")
  set(VERSION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/VERSION")
elseif(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/../VERSION")
  set(VERSION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/..VERSION")
endif()

file(READ "${VERSION_FILE}" SWIPL_VERSION_STRING)

string(STRIP "${SWIPL_VERSION_STRING}" SWIPL_VERSION_STRING)
string(REGEX MATCHALL "[0-9a-z][0-9a-z]*"
       VERSION_COMPONENTS ${SWIPL_VERSION_STRING})

list(GET VERSION_COMPONENTS 0 SWIPL_VERSION_MAJOR)
list(GET VERSION_COMPONENTS 1 SWIPL_VERSION_MINOR)
list(GET VERSION_COMPONENTS 2 SWIPL_VERSION_PATCH)

message("-- Configuring SWI-Prolog-${SWIPL_VERSION_MAJOR}.${SWIPL_VERSION_MINOR}.${SWIPL_VERSION_PATCH}")
endif(NOT SWIPL_VERSION_STRING)