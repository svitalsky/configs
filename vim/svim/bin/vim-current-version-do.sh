#!/bin/bash

# This one is called on background by vim-current-version.sh, so that it can
# put dots on output while downloading data

SOUBOR=$1

if [ -a "$SOUBOR" ]; then
  /bin/rm -f "$SOUBOR"
fi

if [ "$( hostname -f )" = "arnau.mpsv.cz" ]; then
    lynx() {
        http_proxy="http://proxy.mpsv.cz:8080/" /usr/bin/lynx -pauth=svitalskym:zeleNina "$@"
        return $?
    }
else
    lynx() {
        /usr/bin/lynx "$@"
        return $?
    }
fi

VIMVERSION=$(lynx http://www.vim.org/ --dump | \
    grep "is the current version" | \
    sed "s/^.*Vim *\(.*\) *is the current version *$/\1/g")


VIMINSTALLED=$(vim --version | grep IMproved | sed "s/^VIM - Vi IMproved \(.\).*/\1/")

if echo "$VIMVERSION" | grep "^$VIMINSTALLED" &> /dev/null ; then
  echo "$VIMVERSION" > $SOUBOR 
else
  echo Error > $SOUBOR
fi

exit 0
