#!/bin/bash -eux

(
cd "$HOME/pg_src"
git submodule update --init --recursive
export CFLAGS="-O0 -g3"
./configure \
    --enable-tap-tests \
    --prefix=$PGHOME \
) 2>&1 | tee "$HOME/pg_config.log"
