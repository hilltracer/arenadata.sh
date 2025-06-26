#!/bin/bash -eux

(
cd /home/gpadmin
export CONFIGURE_FLAGS=""
source gpdb_src/concourse/scripts/common.bash
install_and_configure_gpdb
gpdb_src/concourse/scripts/setup_gpadmin_user.bash
make_cluster
su - gpadmin
source /usr/local/greenplum-db-devel/greenplum_path.sh;
source gpdb_src/gpAux/gpdemo/gpdemo-env.sh;
createdb --owner="$USER" "$USER"
) 2>&1 | tee "$HOME/demo_standart.log"
