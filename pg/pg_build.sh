#!/bin/bash -eux

(
cd "$HOME/pg_src"

make -j12
sudo make -j12 install

$PGHOME/bin/pg_ctl -D "$DATADIRS/demo" restart -W

) 2>&1 | tee "$HOME/pg_build.log"
