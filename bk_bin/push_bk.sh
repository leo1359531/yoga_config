#!/bin/bash

DIR=$HOME/.backup/

if ! pushd "$DIR";
then
    notify-send "dir error"
    return 1
fi

git add bk_bin
git add config
git add pkg_bk
git add install_bin/
git add walls_bk

git commit -m "$(date)"

git push -u origin main

if ! popd;
then
    notify-send "big error"
    return 1
fi
