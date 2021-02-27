#!/bin/sh

choice=$(fc-list | awk '{print $1}' | sed 's/://g' | dmenu -l 20 -p 'Fonts: ')
display "$choice"
