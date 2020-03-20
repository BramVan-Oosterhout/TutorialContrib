#!/bin/bash
{
echo -n "Install/configure environment "
while [ -e foswiki.conf ]
do
echo -n "+"
sleep 3
done
echo " done."
} 2>/dev/null