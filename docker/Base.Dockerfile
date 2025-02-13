FROM ubuntu:25.04

RUN apt-get update && apt-get -y install sudo build-essential software-properties-common ninja-build wget libssl-dev libmpfr-dev libgmp3-dev libmpc-dev python3-pip clang-format clang-tidy ccache cppcheck pipx
RUN pipx install conan && pipx ensurepath

RUN cd /tmp &&  \
    wget https://github.com/Kitware/CMake/archive/refs/tags/v3.31.3.tar.gz &&  \
    tar -zxvf v3.31.3.tar.gz

RUN cd /tmp/CMake-3.31.3 &&  \
    ./bootstrap &&  \
    sudo gmake &&  \
    sudo gmake install

RUN sudo ln -s ~/.local/bin/conan /usr/local/bin/conan