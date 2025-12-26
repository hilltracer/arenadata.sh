#!/bin/bash -eux

exec 2>&1 &> >(tee "$HOME/regress.log")

pushd "$HOME/src/gpdb$GP_MAJOR/src/test/regress"

# cd "$HOME/src/gpdb$GP_MAJOR/src/test/isolation2"
for i in {1..100};
do
    echo "____________________________________________________________________________________________________________________________";
    echo "                                                                                                                            ";
    echo "====================   START iteration ${i} ================================================================================";
    echo "____________________________________________________________________________________________________________________________";
    
    PGOPTIONS="-c optimizer=off" make installcheck && PGOPTIONS="-c optimizer=on" make installcheck
  #  PGOPTIONS="-c optimizer=off" make -C ../../../gpcontrib/gp_toolkit installcheck && PGOPTIONS="-c optimizer=on" make -C ../../../gpcontrib/gp_toolkit installcheck 
  #  PGOPTIONS="-c optimizer=off" make installcheck
    # make installcheck
    if [ $? -ne 0 ] ;
      then echo "FAILURE DETECTED";
      break;
    fi;
    
    echo "____________________________________________________________________________________________________________________________";
    echo "                                                                                                                            ";
    echo "====================   END iteration ${i} ================================================================================";
    echo "____________________________________________________________________________________________________________________________";
done

popd

# To exec only one test
# - Change src/test/regress/greenplum_schedule.
# - Change src/test/regress/GNUmakefile:
# installcheck-good: all twophase_pqexecparams hooktest query_info_hook_test file_monitor
# -   $(pg_regress_installcheck) $(REGRESS_OPTS) --schedule=$(srcdir)/parallel_schedule --schedule=$(srcdir)/greenplum_schedule $(EXTRA_TESTS)
# +   $(pg_regress_installcheck) $(REGRESS_OPTS) --schedule=$(srcdir)/greenplum_schedule $(EXTRA_TESTS)
