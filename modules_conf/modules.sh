trap "" 1 2 3

MID=/opt/Modules/default/init/

case "$0" in
        -bash|bash|*/bash) test -f $MID/bash && . $MID/bash ;;
           -ksh|ksh|*/ksh) test -f $MID/ksh && . $MID/ksh ;;
              -sh|sh|*/sh) test -f $MID/sh && . $MID/sh ;;
                        *) test -f $MID/sh && . $MID/sh ;;

#default for scripts
esac 

MODULERCFILE=/opt/modulerc
export MODULERCFILE
module add null

trap - 1 2 3
