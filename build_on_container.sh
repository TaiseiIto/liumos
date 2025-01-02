#!/bin/bash

source /root/.cargo/env
rustup toolchain install nightly-x86_64-unknown-linux-gnu
rustup component add rust-src
rustup install nightly
rustup override set nightly
rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-gnu
make tools
make prebuilt
make
make files
zip -r liumos.zip mnt

