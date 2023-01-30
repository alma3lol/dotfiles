#!/usr/bin/env bash


dir="~/.config/rofi/launchers/themes"
theme='ocean'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
