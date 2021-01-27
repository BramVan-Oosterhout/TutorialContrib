#!/bin/bash
mydir=`pwd`
pushd ~/foswiki/Foswiki-2.1.2/data/Sandbox
tar cvzf $mydir/SolutionMacros.tgz SolutionMacros*
popd