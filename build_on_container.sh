#!/bin/bash

source /root/.cargo/env
rustup toolchain install nightly-2021-06-27-x86_64-unknown-linux-gnu
rustup default nightly-2021-06-27-x86_64-unknown-linux-gnu
rustup component add rust-src --toolchain nightly-2021-06-27-x86_64-unknown-linux-gnu
make tools
make prebuilt
make
make files
zip -r liumos.zip mnt

