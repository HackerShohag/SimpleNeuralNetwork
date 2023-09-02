set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")
set(NeuralNetwork "NeuralNetwork")

set(
    SRC
    neuralnetwork.h
    neuralnetwork.cpp
)

set(CMAKE_AUTOMOC ON)
add_library(${NeuralNetwork} SHARED ${SRC})
target_include_directories(${NeuralNetwork} PUBLIC ../Layer)
