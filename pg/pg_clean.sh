#!/bin/sh -eux

(
cd "$HOME/pg_src"
make -j"$(nproc)" clean
# git clean -xdf
) 2>&1 | tee "$HOME/pg_clean.log"
