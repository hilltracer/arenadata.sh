#!/bin/bash -eux

(
cd "$HOME/src/gpdb$GP_MAJOR/src/test/isolation2"
for i in {1..1};
do
    echo "____________________________________________________________________________________________________________________________";
    echo "                                                                                                                            ";
    echo "====================   START iteration ${i} ================================================================================";
    echo "____________________________________________________________________________________________________________________________";
    
    PGOPTIONS="-c optimizer=off" make installcheck && PGOPTIONS="-c optimizer=on" make installcheck
#    PGOPTIONS="-c optimizer=off" make installcheck
    if [ $? -ne 0 ] ;
      then echo "FAILURE DETECTED";
      break;
    fi;
    
    echo "____________________________________________________________________________________________________________________________";
    echo "                                                                                                                            ";
    echo "====================   END iteration ${i} ================================================================================";
    echo "____________________________________________________________________________________________________________________________";
done
) 2>&1 | tee "$HOME/isolation2_loop.log"

# To exec only one test
# Change src/test/isolation2/isolation2_schedule
# Change src/test/regress/GNUmakefile:

# - installcheck: install installcheck-parallel-retrieve-cursor installcheck-ic-tcp installcheck-ic-proxy
# + installcheck: install