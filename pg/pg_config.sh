#!/bin/bash -eux

(
cd "$HOME/src/pg$PG_MAJOR"
git submodule update --init --recursive
export CFLAGS="-O0 -g3"
./configure \
    --prefix=$PGHOME \
) 2>&1 | tee "$HOME/pg_config.log"
