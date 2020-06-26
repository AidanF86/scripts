#!/bin/bash

image=$(sed -n '2p' < ~/.fehbg | awk -F\' '{print $(NF-1)}')

width=$(feh -L '%w' $image)

height=$(feh -L '%h' $image)

wratio=$(bc -l <<< "1920 / $width")
hratio=$(bc -l <<< "1080 / $height")

if (( $(bc -l <<< "$wratio > $hratio") )); then
scale=$wratio
w=1
elif (( $(bc -l <<< "$wratio < $hratio") )); then
scale=$hratio
w=0
else
scale=$hratio
fi

scale=$(bc -l <<< "$scale * 100")
scale=$( printf "%.0f" $scale )
scale="$scale%"

convert "$image" -scale "$scale" /home/aidanfoley/images/wallpapers/lock/current.png

lock="/home/aidanfoley/images/wallpapers/lock/current.png"
#echo "$(feh -L '%w %h' $lock)"

convert "$image" -resize 1920x1080^ -gravity center -extent 1920x1080  /home/aidanfoley/images/wallpapers/lock/current.png

