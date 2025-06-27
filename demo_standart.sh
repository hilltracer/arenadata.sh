#!/bin/bash -ex

(
cd /home/gpadmin
export CONFIGURE_FLAGS=""
source gpdb_src/concourse/scripts/common.bash
install_and_configure_gpdb
gpdb_src/concourse/scripts/setup_gpadmin_user.bash
make_cluster
su - gpadmin -c '
  source /usr/local/greenplum-db-devel/greenplum_path.sh
  source gpdb_src/gpAux/gpdemo/gpdemo-env.sh
  createdb --owner="$USER" "$USER"
'


if [ ! -f /home/gpadmin/.bashrc ]; then
  cp /etc/skel/.bashrc /home/gpadmin/.bashrc
fi

cat << 'EOF' >> /home/gpadmin/.bashrc

if [ -f /usr/local/greenplum-db-devel/greenplum_path.sh ]; then
  source /usr/local/greenplum-db-devel/greenplum_path.sh
fi

if [ -f ~/gpdb_src/gpAux/gpdemo/gpdemo-env.sh ]; then
  source ~/gpdb_src/gpAux/gpdemo/gpdemo-env.sh
fi
EOF
chown gpadmin:gpadmin /home/gpadmin/.bashrc

) 2>&1 | tee "$HOME/demo_standart.log"
