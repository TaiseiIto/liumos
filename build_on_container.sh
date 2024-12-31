#!/bin/bash
rustup toolchain install nightly-x86_64-unknown-linux-gnu
rustup component add rust-src
make tools
make prebuilt
make

