#!/bin/sh

prefix=""

echo "<body bgcolor=\"#aaaaaa\">"
echo "<table>"
for fil in `ls -1 [0-9]*_*.png | sort -k1n,2 -k2,2 -k3n,3n -k4n,4n -t_`; do
    newprefix=`echo $fil | cut -d_ -f1,2`
    if test x"$prefix" = x"$newprefix"; then
        echo "<img src=\"http://RosenborgSupporterSoftware.github.io/media/players/rbk/$fil\" title=\"$fil\"/>";
    else
        if test x"$prefix" = x""; then
            :
        else
            echo "</td></tr>"
        fi
        echo "<tr><td>`echo $fil | cut -d_ -f1-2`</td></tr>"
        echo "<tr><td>"
        echo "<img src=\"http://RosenborgSupporterSoftware.github.io/media/players/rbk/$fil\" title=\"$fil\"/>";
    fi
    prefix=$newprefix
done

echo "</td></tr>"
echo "</table>"
echo "</body>"

