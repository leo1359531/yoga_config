#!/bin/bash

# copy all config manual made file fot github upload 

cp -r -u ~/.config/bin/ ~/.bk/config
cp -r -u ~/.config/bspwm/ ~/.bk/config
cp -r -u ~/.config/polybar/ ~/.bk/config
cp -r -u ~/.config/rofi/ ~/.bk/config
cp -r -u ~/.config/sxhkd/ ~/.bk/config


cp -r -u ~/.Xresources ~/.bk/home
cp -r -u ~/.vimrc ~/.bk/home
cp -r -u ~/.xinitrc ~/.bk/home
cp -r -u ~/.zshrc ~/.bk/home
