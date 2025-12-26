#!/bin/sh -eux
(
export TESTDIR="$HOME/src/gpdb$GP_MAJOR/src/test/modules/test_pg_dump"
cd "$TESTDIR"
rm -rf tmp_check tmp_check_copy

# Clear if needed
# dropdb contrib_regression --if-exists
# psql -c "drop owned by regress_dump_test_role;"
# psql -c "drop role regress_dump_test_role;"

## For run regression and tap tests
make install
make installcheck

## For run only tap tests
# export top_builddir="$HOME/src/gpdb$GP_MAJOR"
# export PG_REGRESS="$top_builddir/src/test/regress/pg_regress"
# export REGRESS_SHLIB="$top_builddir/src/test/regress/regress.so"
# export TESTDATADIR="$TESTDIR/tmp_check"
# export TESTLOGDIR="$TESTDATADIR/log"
# prove --verbose -I ../../../../src/test/perl/ t/001_base.pl

) 2>&1 | tee "$HOME/test_pg_dump.log"
