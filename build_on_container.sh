#!/bin/bash
rustup toolchain install nightly-x86_64-unknown-linux-gnu
rustup component add rust-src
make tools
make prebuilt
make
rustup install nightly
rustup override set nightly
rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-gnu

