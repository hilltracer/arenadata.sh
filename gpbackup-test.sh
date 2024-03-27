#!/bin/sh -eux

(
rm -rf "$HOME/gpAdminLogs/"*.log
#dropuser testrole || echo $?
dropdb --if-exists restoredb
dropuser --if-exists testrole
rm "$DATADIRS"/*/*/gpbackup_* || echo $?
#cd "$HOME/src/gpdb$GP_MAJOR/contrib/dummy_seclabel"
#make -j"$(nproc)" install
cd "$HOME/src/gpbackup"
#gpconfig -c shared_preload_libraries -v dummy_seclabel
#gpstop -afr
#make -j"$(nproc)" test
#make -j"$(nproc)" unit
#make -j"$(nproc)" integration
#make -j"$(nproc)" end_to_end
#make -j"$(nproc)" lint
#ginkgo -r --keep-going --randomize-suites --randomize-all --no-color --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir "/tmp" 2>&1
export CUSTOM_BACKUP_DIR="$HOME/gpbackup"
export GINKGO_FLAGS="-r --keep-going --randomize-suites --randomize-all --no-color --poll-progress-after=0s --v"
#export GINKGO_FLAGS="-r --keep-going --randomize-suites --randomize-all --no-color --poll-progress-after=0s -vv"
#export TEST_GPDB_VERSION=6.999.0
export TEST_GPDB_VERSION="$GP_MAJOR.999.0"
#export GINKGO_FLAGS="-r --keep-going --randomize-suites --randomize-all --no-color -vv"
#export GINKGO_FLAGS="-r --keep-going --no-color --v"
#export GINKGO_FLAGS="-r --keep-going --no-color -vv"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "restores from --exclude filtered incremental backup with partition tables"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "panics if given a leaf partition table and --leaf-partition-data is not set"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs gpbackup and gprestore with leaf-partition-data and exclude-table root partition backup flags"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs gpbackup and gprestore with leaf-partition-data and exclude-table leaf partition backup flags"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs gpbackup and gprestore without leaf-partition-data and with exclude-table root partition backup flags"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs gpbackup and gprestore with leaf-partition-data and exclude-table root partition backup flags"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs gpbackup and gprestore with leaf-partition-data and exclude-table leaf partition backup flags"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Can backup a 7-segment cluster and restore to current cluster"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Restore to a different-sized cluster"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs gpbackup and gprestore with with-stats flag"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Extensions dependency"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "End to End incremental tests Incremental restore No DDL no partitioning Existing tables in existing schemas were updated"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "End to End incremental tests Incremental restore No DDL no partitioning Include/Exclude schemas and tables"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Extensions dependency" --ginkgo.focus "End to End incremental tests Incremental restore No DDL no partitioning Existing tables in existing schemas were updated" --ginkgo.focus "End to End incremental tests Incremental restore No DDL no partitioning Include/Exclude schemas and tables"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Extensions dependency" --ginkgo.focus "End to End incremental tests Incremental restore No DDL no partitioning Include/Exclude schemas and tables"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Extensions dependency" --ginkgo.focus "Restores only tables included by use if user input is provided"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Extensions dependency" --ginkgo.focus "End to End incremental tests Incremental restore No DDL no partitioning Existing tables in existing schemas were updated"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "End to End incremental tests Incremental restore No DDL no partitioning Existing tables in existing schemas were updated" --ginkgo.focus "End to End incremental tests Incremental restore No DDL no partitioning Include/Exclude schemas and tables"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "restores statistics for leaf partitions when leaf-partition-data flag was specified with backup when runs gprestore with with-stats flag"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Can backup a 2-segment cluster and restore to current cluster"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Can backup a 9-segment cluster and restore to current cluster"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Can backup a 9-segment cluster and restore to current cluster"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Restore to a different-sized cluster"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Can backup a 9-segment cluster and restore to current cluster with replicated tables"
#ginkgo $GINKGO_FLAGS --timeout=40m --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs gprestore with copy-queue-size and sends a SIGTERM to ensure cleanup functions successfully"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs gpbackup with copy-queue-size and sends a SIGTERM to ensure cleanup functions successfully"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs gpbackup and sends a SIGINT to ensure blocked LOCK TABLE query is canceled"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "restores from a incremental backup specified with a backup directory"
ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s utils -- --ginkgo.focus "StartGpbackupHelpers"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs restore gpbackup_helper with gzip compression with plugin"
#ginkgo $GINKGO_FLAGS --timeout=10s --poll-progress-after=0s integration -- --ginkgo.focus "runs restore gpbackup_helper with gzip compression with plugin"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "does not hold lock on gp_segment_configuration when backup is in progress"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs gpbackup and gprestore with the data-only restore flag"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs gpbackup and sends a SIGTERM to ensure cleanup functions successfully"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "SIGTERM"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Will clean up segments helper processes after error during restore"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs gpbackup and gprestore with with-stats flag and single-backup-dir"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs gpbackup and gprestore to backup functions depending on table row's type"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs gpbackup and gprestore on database with all objects"
#ginkgo $GINKGO_FLAGS --timeout=10m --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs gprestore with copy-queue-size and sends a SIGTERM to ensure cleanup functions successfully" --ginkgo.focus "runs gpbackup and gprestore on database with all objects"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "runs gprestore with --redirect-schema restoring data and statistics to the new schema"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Redirect Schema"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Can backup a 2-segment cluster and restore to current cluster single data file" --ginkgo.focus "Can backup a 7-segment cluster and restore to current cluster with a filter" --ginkgo.focus "runs gprestore with --redirect-schema restoring data and statistics to the new schema"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Restore to a different-sized cluster" --ginkgo.focus "Redirect Schema"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "constructs dependencies correctly for a function dependent on an implicit array type"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "type dependencies"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "PrintCreateBaseTypeStatement"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Exclude subpartitions for given root partition in leaf-partition-data mode"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "correctly maps oids to parent or leaf table types"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "PrintRegularTableCreateStatement"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "creates a one-level partition table"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "creates a two-level partition table"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "creates a GPDB 7"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration --
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "returns a slice for a base type with"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "Tables order cases, when there is a partitioned table to backup"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "Wrappers Integration"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "GetPartitionTableMap"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "BackupDataForAllTables"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "Tables order cases, when there is a partitioned table to backup" --ginkgo.focus "Tables order cases, when there is an AO/CO table to backup"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "Tables order cases, when there is an AO/CO table to backup"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "Tables order when no filtering is used or tables filtering is defined"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "RetrieveAndProcessTables"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "Tables order when schema filtering is defined"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "Tables order when schema filtering is defined"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "RetrieveAndProcessTables" --ginkgo.focus "Tables order when no filtering is used or tables filtering is defined"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s integration -- --ginkgo.focus "returns the data tables in descending order of their sizes (relpages) when include-tables(-file) flag is used"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s restore -- --ginkgo.focus "verifies backup file counts match on all segments with resize-cluster"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s backup -- --ginkgo.focus "SplitTablesByPartitionType"
#ginkgo $GINKGO_FLAGS --timeout=3h --poll-progress-after=0s end_to_end -- --custom_backup_dir $CUSTOM_BACKUP_DIR --ginkgo.focus "Exclude subpartitions for given root partition in leaf-partition-data mode" --ginkgo.focus "End to End incremental tests Incremental restore No DDL no partitioning Include/Exclude schemas and tables"
#make depend build install integration end_to_end
) 2>&1 | tee "$HOME/gpbackup-test.log"
