#!/bin/bash

pacman -Qqen > ~/.backup/pkg_bk/pac.bk
pacman -Qqem > ~/.backup/pkg_bk/yay.bk

# in to restore:
# pacman -S - < pkglist.txt
