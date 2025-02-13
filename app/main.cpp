#include "Example.hpp"
#include <fmt/base.h>
#include <spdlog/spdlog.h>

int main(){
    fmt::print("Hello World {}\n", Example::value());
    spdlog::info("Hello World {}", Example::value());
}