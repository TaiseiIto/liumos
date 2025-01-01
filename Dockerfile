FROM ubuntu:20.04

# Don't ask stdin anything to install software automatically.
ENV DEBIAN_FRONTEND=noninteractive

# Install softwares.
RUN apt update
RUN apt upgrade -y
RUN apt install -y clang-8
RUN apt install -y clang-format
RUN apt install -y cmake
RUN apt install -y curl
RUN apt install -y git
RUN apt install -y libc++-8-dev
RUN apt install -y libc++abi-8-dev
RUN apt install -y lld
RUN apt install -y lld-8
RUN apt install -y netcat
RUN apt install -y qemu-system-x86
RUN apt install -y vim
RUN apt install -y wget

# Install Rust.
RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y

# Build liumOS.
WORKDIR /root
RUN git clone https://github.com/hikalium/liumos.git
WORKDIR /root/liumos
RUN git checkout dd619eb19c0c04504228494e8af65945ad31aa9b
COPY build_on_container.sh build_on_container.sh
COPY patch patch
RUN git apply patch

# Expose VNC port.
ARG vnc_port
EXPOSE $vnc_port

