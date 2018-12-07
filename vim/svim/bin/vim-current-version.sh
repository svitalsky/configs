#!/bin/bash

TMPADR="/var/memtmp"
SOUBOR=$TMPADR/vim-check-tmp-file.$$
DOITSCRIPT="/usr/local/share/vim/svim/bin/vim-current-version-do.sh"

if !([ -f $DOITSCRIPT ]); then
  echo "Cannot find $DOITSCRIPT -- exiting!"
  exit 1
fi

if touch $SOUBOR &> /dev/null ; then
  /bin/rm -f $SOUBOR
else
  echo "Cannot touch $SOUBOR -- exiting!"
  exit 1
fi

echo -n "Connecting www.vim.org ."
$DOITSCRIPT $SOUBOR &> /dev/null &
sleep 1
while ! [ -a $SOUBOR ] ; do
  echo -n '.'
  sleep 1
done

RESULT=$(cat $SOUBOR)
/bin/rm -f $SOUBOR

if echo $RESULT | grep "Error" &> /dev/null ; then
  echo " connection failed."
else
  echo -n " current Vim version is: "
  echo $RESULT
fi

exit 0
