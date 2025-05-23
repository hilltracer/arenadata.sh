#!/bin/sh -eux

(
cd "$HOME/src/adbcc"
git submodule update --init --recursive
sudo sysctl -w net.unix.max_dgram_qlen=4096
cd "$HOME/src/adbcc/adcc-extension"
make -j"$(nproc)" clean
make -j"$(nproc)"
make -j"$(nproc)" install
cd "$HOME/src/adbcc/adcc-extension/test/socket"
make -j"$(nproc)" clean
make -j"$(nproc)"
make -j"$(nproc)" install
#gpconfig -c shared_preload_libraries -v 'gpadcc'
gpconfig -c shared_preload_libraries -v "$(psql -At -c "SELECT array_to_string(array_append(string_to_array(current_setting('shared_preload_libraries'), ','), 'gpadcc'), ',')" postgres)"
gpconfig -c gp_enable_query_metrics -v on
psql -d postgres -c "CREATE EXTENSION IF NOT EXISTS gpadcc"
gpstop -afr
#gpconfig -c adcc.send_buffer_size -v 10485760;
gpconfig -c adcc.monitor_inner_queries -v on
gpconfig -c adcc.monitor_utility_inner_queries -v on
gpstop -u
) 2>&1 | tee "$HOME/adbcc.log"
