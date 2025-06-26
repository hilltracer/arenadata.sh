#!/bin/bash -eux

(
cd "$HOME/src/pg$PG_MAJOR"

make -j12
sudo make -j12 install
) 2>&1 | tee "$HOME/pg_build.log"
