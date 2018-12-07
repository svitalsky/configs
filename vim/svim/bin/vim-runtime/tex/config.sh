#!/bin/bash

# The meaning of all this: some time after X start my local changes in PATH (made in ~/.bash_profile)
# disappear from programs started by X, i.e. when I start Gvim from command line the
# PATH is all right, however when I start it by Unity keyboard shortcut the PATH is wrong.
# Hence we need to repeat here what has been done in .bash_profile.

# XXX: also, DO NOT FORGET to create symlink /home/m/bin/dvips -> ../tex/bin/dvips

# $1 - co se ma pridat k promenne
# $2 - k jake promenne - default je PATH
# $3 - after => za dosavadni hodnotu, jinak pred ni
add_to_path() {
    if [ "$2" != "" ]; then
        eval path_to_add='$'"$2"
        path_to_add_nm="$2"
    else
        path_to_add="$PATH"
        path_to_add_nm="PATH"
    fi

    if [ "$path_to_add" != "" ]; then
        if ! echo "$path_to_add" | /bin/egrep -q "(^|:)$1($|:)" ; then
            if [ "$3" = "after" ] ; then
                echo $path_to_add | /bin/egrep -q ":$" && colon="" || colon=":"
                path_to_add="${path_to_add}${colon}$1"
            else
                echo $path_to_add | /bin/egrep -q "^:" && colon="" || colon=":"
                path_to_add="$1${colon}${path_to_add}"
            fi
        fi
    else
        path_to_add="$1"
    fi

    eval "$path_to_add_nm"="$path_to_add"

    unset path_to_add path_to_add_nm
}


while echo $PATH | egrep -q "$HOME/bin" ; do
    PATH=$( echo $PATH | sed "s-\(.*\)$HOME/bin:\?\(.*\)-\1\2-" )
done

TEXLIVE_BIN="$HOME/tex/bin"
if [ -d "$TEXLIVE_BIN" ]; then
    add_to_path "$TEXLIVE_BIN"
fi

if [ "$HOME" != "" ] && [ -d "$HOME" ] && [ -d "$HOME/bin" ]; then
    add_to_path "$HOME/bin"
fi
export PATH

# NO EXIT!

