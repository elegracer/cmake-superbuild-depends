if(NOT TARGET options::moderncpp)
  add_library(options::moderncpp INTERFACE IMPORTED GLOBAL)
  if(TARGET options::cpp17)
    target_link_libraries(options::moderncpp INTERFACE options::cpp17)
  elseif(TARGET options::cpp14)
    target_link_libraries(options::moderncpp INTERFACE options::cpp14)
  elseif(TARGET options::cpp11)
    target_link_libraries(options::moderncpp INTERFACE options::cpp11)
  else()
    message(FATAL_ERROR "options::moderncpp expects options::cpp11 or above.")
  endif()
endif()
