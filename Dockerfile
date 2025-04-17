FROM ubuntu:20.04

# Don't ask stdin anything to install software automatically.
ENV DEBIAN_FRONTEND=noninteractive

# Install softwares.
RUN apt-get update && apt-get upgrade -y && apt-get install -y clang-8
RUN apt-get update && apt-get upgrade -y && apt-get install -y clang-format
RUN apt-get update && apt-get upgrade -y && apt-get install -y cmake
RUN apt-get update && apt-get upgrade -y && apt-get install -y curl
RUN apt-get update && apt-get upgrade -y && apt-get install -y git
RUN apt-get update && apt-get upgrade -y && apt-get install -y libc++-8-dev
RUN apt-get update && apt-get upgrade -y && apt-get install -y libc++abi-8-dev
RUN apt-get update && apt-get upgrade -y && apt-get install -y lld
RUN apt-get update && apt-get upgrade -y && apt-get install -y lld-8
RUN apt-get update && apt-get upgrade -y && apt-get install -y netcat
RUN apt-get update && apt-get upgrade -y && apt-get install -y qemu-system-x86
RUN apt-get update && apt-get upgrade -y && apt-get install -y vim
RUN apt-get update && apt-get upgrade -y && apt-get install -y wget
RUN apt-get update && apt-get upgrade -y && apt-get install -y zip

# Install Rust.
# Rust 1.65.0 is released on 3 November, 2022
RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain=nightly-2022-11-03-x86_64-unknown-linux-gnu

# Build liumOS.
WORKDIR /root
RUN git clone https://github.com/hikalium/liumos.git
WORKDIR /root/liumos
RUN git checkout dd619eb19c0c04504228494e8af65945ad31aa9b
COPY build_on_container.sh build_on_container.sh
COPY run_on_container.sh run_on_container.sh

# Expose VNC port.
ARG vnc_port
EXPOSE $vnc_port

