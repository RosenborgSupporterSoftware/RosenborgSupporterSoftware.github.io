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
for fil in `ls -1 [0-9]*_*.png | encode | sort -k1n,2 -k2,2 -k3n,3n -k4n,4n -t_ | decode`; do
    newprefix=`echo $fil | encode | cut -d_ -f1,2 | decode`
    if test x"$prefix" = x"$newprefix"; then
        echo "<img src=\"http://RosenborgSupporterSoftware.github.io/media/players/rbk/$fil\" title=\"$fil\"/>";
    else
        if test x"$prefix" = x""; then
            :
        else
            echo "</td></tr>"
        fi
        echo "<tr><td>`echo $fil | encode | cut -d_ -f1-2 | decode`</td></tr>"
        echo "<tr><td>"
        echo "<img src=\"http://RosenborgSupporterSoftware.github.io/media/players/rbk/$fil\" title=\"$fil\"/>";
    fi
    prefix=$newprefix
done

echo "</td></tr>"
echo "</table>"
echo "</body>"

