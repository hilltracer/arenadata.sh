#!/bin/sh -eux

(
cd "$HOME/src/pg$PG_MAJOR"
make -j"$(nproc)" clean
git clean -xdf
) 2>&1 | tee "$HOME/pg_clean.log"
