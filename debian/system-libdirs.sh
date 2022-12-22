#!/bin/sh

set -eu

gcc="$1"

for opt in '' $(${CC-"$gcc"} -print-multi-lib | sed -n -e's/.*;@/-/p'); do
    "$gcc" $opt -print-search-dirs |
    sed -n -e 's/^libraries: =//p' |
    sed -e 's/:/\n/g' |
    xargs -n1 readlink -f |
    grep -v 'gcc\|/[0-9.]\+$'
done |
while read -r line; do
    case "$line" in
        (/usr/*)
            echo "$line"
            echo "${line#/usr}"
            ;;
        (/lib*)
            echo "$line"
            echo "/usr$line"
            ;;
        (*)
            echo "$line"
            ;;
    esac
done |
LC_ALL=C sort -u |
tr '\n' : |
sed 's/:$//'
