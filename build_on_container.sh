#!/bin/bash

source /root/.cargo/env
# Rust 1.65.0 is released on 3 November, 2022
rustup toolchain install nightly-2022-11-03-x86_64-unknown-linux-gnu
rustup default nightly-2022-11-03-x86_64-unknown-linux-gnu
rustup component add rust-src --toolchain nightly-2022-11-03-x86_64-unknown-linux-gnu
make tools
make prebuilt
make
make files
zip -r liumos.zip mnt

