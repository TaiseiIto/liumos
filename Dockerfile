FROM ubuntu:22.04

# Don't ask stdin anything to install software automatically.
ENV DEBIAN_FRONTEND=noninteractive

# Install softwares.
RUN apt update
RUN apt upgrade -y
RUN apt install -y clang
RUN apt install -y clang-format
RUN apt install -y cmake
RUN apt install -y curl
RUN apt install -y git
RUN apt install -y libc++-dev
RUN apt install -y libc++abi-dev
RUN apt install -y lld
RUN apt install -y qemu-system-x86
RUN apt install -y vim
RUN apt install -y wget

# Install Rust.
RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y
# RUN rustup toolchain install nightly-x86_64-unknown-linux-gnu
# RUN rustup component add rust-src

# Build liumOS.
WORKDIR /root
RUN git clone https://github.com/hikalium/liumos.git
WORKDIR /root/liumos
# RUN make tools
# RUN make prebuilt
# RUN make

