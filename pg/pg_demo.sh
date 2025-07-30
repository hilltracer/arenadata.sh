#!/bin/bash -eux

(
killall -9 psql || echo $?
killall -9 postgres || echo $?

sudo rm -rf $DATADIRS/demo/*
sudo rm -rf /tmp/.s.PGSQL.* "$HOME/.ssh/known_hosts"


cd "$HOME/src/pg$PG_MAJOR"


$PGHOME/bin/initdb -D "$DATADIRS/demo"
$PGHOME/bin/pg_ctl -D "$DATADIRS/demo" -l logfile start -w
export PATH=$PGHOME/bin:$PATH
export LD_LIBRARY_PATH=$PGHOME/lib:$LD_LIBRARY_PATH
$PGHOME/bin/createdb test
createdb --owner="$USER" "$USER"

) 2>&1 | tee "$HOME/pg_demo.log"

# psql start : $PGHOME/bin/psql postgres

# stop the server: $PGHOME/bin/pg_ctl -D "$DATADIRS/demo" stop



