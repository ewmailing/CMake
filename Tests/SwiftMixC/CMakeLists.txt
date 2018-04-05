cmake_minimum_required(VERSION 3.11)
project(SwiftMixC C Swift)

add_executable(SwiftMixC main.swift DoSomething.c)
set_property(TARGET SwiftMixC PROPERTY SWIFT_BRIDGING_HEADER "${PROJECT_SOURCE_DIR}/MySwiftBridgingHeader.h")

