#!/bin/sh -eux
(
export TESTDIR="$HOME/src/gpdb$GP_MAJOR/contrib/postgres_fdw"
cd "$TESTDIR"

make -j12 install
make installcheck
PGOPTIONS="-c optimizer=off" make installcheck

) 2>&1 | tee "$HOME/postgres_fdw.log"
