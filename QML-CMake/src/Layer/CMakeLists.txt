set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")
set(Layer "Layer")

set(
    SRC
    layer.h
    layer.cpp
)

set(CMAKE_AUTOMOC ON)

add_library(${Layer} SHARED ${SRC})
