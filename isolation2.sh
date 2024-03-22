#!/bin/sh -eux

(
cd "$HOME/src/gpdb$GP_MAJOR/src/test/isolation2"
make -j$(nproc) clean
make -j$(nproc) install
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_parallel_retrieve_cursor --inputdir=. --dbname=isolation2parallelretrcursor --load-extension=gp_inject_fault --schedule=./parallel_retrieve_cursor_schedule
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup cached_plan gpdispatch checkpoint_dtx_info lockmodes prepare_limit pg_rewind_fail_missing_xlog prepared_xact_deadlock_pg_rewind ao_partition_lock query_gp_partitions_view dml_on_root_locks_all_parts select_dropped_table update_hash_col_utilitymode execute_on_utilitymode uao_crash_compaction_column
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 resgroup/resgroup_memory_limit
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 select_for_update gdd/prepare gdd/concurrent_update
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 ao_select
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup ao vacuum_drop_phase_ao uao/alter_while_vacuum_row uao/alter_while_vacuum2_row uao/cursor_before_deletevacuum_row uao/delete_while_vacuum_row uao/insert_while_vacuum_row uao/modcount_vacuum_row uao/select_after_vacuum_row uao/select_after_vacuum_serializable_row uao/select_before_vacuum_row uao/select_while_full_vacuum_row uao/select_while_vacuum_row uao/select_while_vacuum_serializable_row uao/select_while_vacuum_serializable2_row uao/selectinsert_while_vacuum_row uao/selectinsertupdate_while_vacuum_row uao/selectupdate_while_vacuum_row uao/update_while_vacuum_row uao/vacuum_self_serializable_row uao/vacuum_self_serializable2_row uao/vacuum_self_serializable3_row uao/vacuum_while_insert_row uao/vacuum_while_vacuum_row uao/vacuum_cleanup_row uao/vacuum_index_stats_row reorganize_after_ao_vacuum_skip_drop truncate_after_ao_vacuum_skip_drop mark_all_aoseg_await_drop concurrent_vacuum_with_delete
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup ao uao/vacuum_cleanup_row uao/update_while_vacuum_row mark_all_aoseg_await_drop
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup ao uao/vacuum_cleanup_row uao/vacuum_cleanup_column uao/update_while_vacuum_row mark_all_aoseg_await_drop uao_crash_compaction_column gdd/prepare gdd/planner_insert_while_vacuum_drop
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup add_column_after_vacuum_skip_drop_column mark_all_aoseg_await_drop reorganize_after_ao_vacuum_skip_drop truncate_after_ao_vacuum_skip_drop vacuum_after_vacuum_skip_drop_column vacuum_drop_phase_ao uao_crash_compaction_column uao/insert_should_not_use_awaiting_drop_column uao/insert_should_not_use_awaiting_drop_row uao/insert_while_vacuum_drop_column uao/insert_while_vacuum_drop_row uao/update_while_vacuum_row uao/vacuum_cleanup_column uao/vacuum_cleanup_row gdd/prepare gdd/planner_insert_while_vacuum_drop
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup uao_crash_compaction_column gdd/planner_insert_while_vacuum_drop vacuum_drop_phase_ao uao/compaction_utility_row uao/select_after_vacuum_row uao/select_while_full_vacuum_row uao/select_while_vacuum_row uao/select_while_vacuum_serializable_row uao/selectupdate_while_vacuum_row uao/update_while_vacuum_row uao/vacuum_self_serializable2_row uao/vacuum_while_insert_row uao/vacuum_cleanup_row uao/insert_should_not_use_awaiting_drop_row reorganize_after_ao_vacuum_skip_drop truncate_after_ao_vacuum_skip_drop mark_all_aoseg_await_drop uao/compaction_utility_column uao/select_after_vacuum_column uao/select_while_full_vacuum_column uao/select_while_vacuum_column uao/select_while_vacuum_serializable_column uao/selectupdate_while_vacuum_column uao/update_while_vacuum_column uao/vacuum_self_serializable2_column uao/vacuum_while_insert_column uao/vacuum_cleanup_column uao/insert_should_not_use_awaiting_drop_column vacuum_while_reindex_ao_bitmap
#./pg_isolation2_regress --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup uao_crash_compaction_column gdd/prepare gdd/planner_insert_while_vacuum_drop vacuum_drop_phase_ao uao/vacuum_cleanup_row uao/insert_should_not_use_awaiting_drop_row reorganize_after_ao_vacuum_skip_drop truncate_after_ao_vacuum_skip_drop mark_all_aoseg_await_drop uao/vacuum_cleanup_column uao/insert_should_not_use_awaiting_drop_column add_column_after_vacuum_skip_drop_column vacuum_after_vacuum_skip_drop_column
#./pg_isolation2_regress --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup uao/insert_should_not_use_awaiting_drop_row uao/insert_should_not_use_awaiting_drop_column
#./pg_isolation2_regress --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup gdd/prepare uao_crash_compaction_column gdd/planner_insert_while_vacuum_drop vacuum_drop_phase_ao uao/vacuum_cleanup_row mark_all_aoseg_await_drop uao/vacuum_cleanup_column add_column_after_vacuum_skip_drop_column vacuum_after_vacuum_skip_drop_column
#./pg_isolation2_regress --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup add_column_after_vacuum_skip_drop_column
#./pg_isolation2_regress --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup gdd/prepare gdd/planner_insert_while_vacuum_drop
#./pg_isolation2_regress --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup uao/insert_while_vacuum_drop_column uao/insert_while_vacuum_drop_row
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 ao
#./pg_isolation2_regress --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup add_column_after_vacuum_skip_drop_column concurrent_vacuum_with_delete gdd/prepare gdd/planner_insert_while_vacuum_drop mark_all_aoseg_await_drop reorganize_after_ao_vacuum_skip_drop truncate_after_ao_vacuum_skip_drop uao/alter_while_vacuum2_row uao/alter_while_vacuum_row uao/compaction_utility_column uao/compaction_utility_row uao_crash_compaction_column uao/cursor_before_deletevacuum_row uao/delete_while_vacuum_row uao/insert_should_not_use_awaiting_drop_column uao/insert_should_not_use_awaiting_drop_row uao/insert_while_vacuum_drop_column uao/insert_while_vacuum_drop_row uao/insert_while_vacuum_row uao/modcount_vacuum_row uao/select_after_vacuum_column uao/select_after_vacuum_row uao/select_after_vacuum_serializable_row uao/select_before_vacuum_row uao/selectinsertupdate_while_vacuum_row uao/selectinsert_while_vacuum_row uao/selectupdate_while_vacuum_column uao/selectupdate_while_vacuum_row uao/select_while_full_vacuum_column uao/select_while_full_vacuum_row uao/select_while_vacuum_column uao/select_while_vacuum_row uao/select_while_vacuum_serializable2_row uao/select_while_vacuum_serializable_column uao/select_while_vacuum_serializable_row uao/update_while_vacuum_column uao/update_while_vacuum_row uao/vacuum_cleanup_column uao/vacuum_cleanup_row uao/vacuum_index_stats_row uao/vacuum_self_serializable2_column uao/vacuum_self_serializable2_row uao/vacuum_self_serializable3_row uao/vacuum_self_serializable_row uao/vacuum_while_insert_column uao/vacuum_while_insert_row uao/vacuum_while_vacuum_row vacuum_after_vacuum_skip_drop_column vacuum_drop_phase_ao reindex/vacuum_while_reindex_ao_bitmap
#./pg_isolation2_regress --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup add_column_after_vacuum_skip_drop_column concurrent_vacuum_with_delete gdd/prepare gdd/planner_insert_while_vacuum_drop mark_all_aoseg_await_drop reorganize_after_ao_vacuum_skip_drop truncate_after_ao_vacuum_skip_drop uao/alter_while_vacuum2_row uao/alter_while_vacuum_row uao/compaction_utility_column uao/compaction_utility_row uao_crash_compaction_column uao/cursor_before_deletevacuum_row uao/delete_while_vacuum_row uao/insert_should_not_use_awaiting_drop_column uao/insert_should_not_use_awaiting_drop_row uao/insert_while_vacuum_drop_column uao/insert_while_vacuum_drop_row uao/insert_while_vacuum_row uao/modcount_vacuum_row uao/select_after_vacuum_column uao/select_after_vacuum_row uao/select_after_vacuum_serializable_row uao/select_before_vacuum_row uao/selectinsertupdate_while_vacuum_row uao/selectinsert_while_vacuum_row uao/selectupdate_while_vacuum_column uao/selectupdate_while_vacuum_row uao/select_while_full_vacuum_column uao/select_while_full_vacuum_row uao/select_while_vacuum_column uao/select_while_vacuum_row uao/select_while_vacuum_serializable2_row uao/select_while_vacuum_serializable_column uao/select_while_vacuum_serializable_row uao/update_while_vacuum_column uao/update_while_vacuum_row uao/vacuum_cleanup_column uao/vacuum_cleanup_row uao/vacuum_index_stats_row uao/vacuum_self_serializable2_column uao/vacuum_self_serializable2_row uao/vacuum_self_serializable3_row uao/vacuum_self_serializable_row uao/vacuum_while_insert_column uao/vacuum_while_insert_row uao/vacuum_while_vacuum_row vacuum_after_vacuum_skip_drop_column vacuum_drop_phase_ao reindex/vacuum_while_reindex_ao_bitmap uao/vacuum_while_max_concurrency_column uao/vacuum_while_max_concurrency_row
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 ao ao_insert ao_delete ao_select
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 ao ao_insert
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup uao_crash_compaction_column vacuum_drop_phase_ao reorganize_after_ao_vacuum_skip_drop truncate_after_ao_vacuum_skip_drop mark_all_aoseg_await_drop
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup vacuum_drop_phase_ao
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 truncate_after_ao_vacuum_skip_drop
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 mark_all_aoseg_await_drop mark_all_aoseg_await_dropMY
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --schedule=./isolation2_schedule.test
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 reorganize_after_ao_vacuum_skip_drop truncate_after_ao_vacuum_skip_drop mark_all_aoseg_await_drop
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 vacuum_after_vacuum_skip_drop_column
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 uao_crash_compaction_column
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup uao/compaction_utility_row
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup uao/vacuum_cleanup_column
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup uao/vacuum_while_max_concurrency_column uao/vacuum_while_max_concurrency_row uao/vacuum_while_max_concurrencyMY_column uao/vacuum_while_max_concurrencyMY_row
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup uao/vacuum_while_max_concurrencyMY_column uao/vacuum_while_max_concurrencyMY_row
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 setup uao/vacuum_while_max_concurrency_column uao/vacuum_while_max_concurrency_row
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault idle_gang_cleaner idle_gang_cleanerMY
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault idle_gang_cleanerMY
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault orphaned_gang_cleaner
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault orphaned_gang_cleanerMY
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault idle_gang_cleaner
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault segwalrep/dtm_recovery_on_standbyMY
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault segwalrep/dtm_recovery_on_standby
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault segwalrep/dtm_recovery_on_standby orphaned_gang_cleaner
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault prevent_ao_wal
./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault frozen_insert_crash
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault pg_rewind_fail_missing_xlog
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault segwalrep/dtx_recovery_wait_lsn
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault segwalrep/replication_keeps_crash
#sudo cgconfigparser -l /etc/cgconfig.conf
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_resgroup --load-extension=gp_inject_fault resgroup/enable_resgroup_validate resgroup/enable_resgroup resgroup/resgroup_views resgroup/resgroup_cpu_rate_limit resgroup/resgroup_memory_limit
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_resgroup --load-extension=gp_inject_fault resgroup/resgroup_views resgroup/resgroup_cpu_rate_limit resgroup/resgroup_memory_limit
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_resgroup --load-extension=gp_inject_fault resgroup/resgroup_auxiliary_tools_v1 resgroup/resgroup_bypass_catalog resgroup/resgroup_views resgroup/resgroup_memory_limit
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_resgroup --load-extension=gp_inject_fault resgroup/resgroup_bypass_catalog resgroup/resgroup_views resgroup/resgroup_memory_limit
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_resgroup --load-extension=gp_inject_fault resgroup/enable_resgroup_validate resgroup/enable_resgroup
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault frozen_insert_crashMY
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 idle_gang_cleanerMY
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault cancel_query cancel_queryMY
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault uao_crash_compaction_column uao_crash_compaction_row
#./pg_isolation2_regress  --init-file=../../../src/test/regress/init_file --init-file=./init_file_isolation2 --load-extension=gp_inject_fault segwalrep/fts_unblock_primary segwalrep/recoverseg_from_file
#make -j$(nproc) installcheck -i
#test -f regression.diffs && cat regression.diffs
) 2>&1 | tee "$HOME/isolation2.log"
