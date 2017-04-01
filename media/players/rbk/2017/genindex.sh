#!/bin/sh

prefix=""

function encode() {
    sed -e 's/de_lan/de-lan/g' -e 's/faye_lund/faye-lund/g'
}

function decode() {
    sed -e 's/de-lan/de_lan/g' -e 's/faye-lund/faye_lund/g'
}


echo "<body bgcolor=\"#aaaaaa\">"
echo "<table>"
for fil in `ls -1 *.png | encode | sort -t_ -k1d -k2n | decode`; do
    newprefix=`echo $fil | encode | cut -d_ -f1 | decode`
    if test x"$prefix" = x"$newprefix"; then
        echo "<img src=\"$fil\" title=\"$fil\"/>";
    else
        if test x"$prefix" = x""; then
            :
        else
            echo "</td></tr>"
        fi
        echo "<tr><td>`echo $fil | encode | cut -d_ -f1 | decode`</td></tr>"
        echo "<tr><td>"
        echo "<img src=\"$fil\" title=\"$fil\"/>";
    fi
    prefix=$newprefix
done

echo "</td></tr>"
echo "</table>"
echo "</body>"

