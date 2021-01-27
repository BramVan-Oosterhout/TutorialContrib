#!/bin/bash
# Prepare the assets directory
mydir=`pwd`
pushd ~/foswiki/Foswiki-2.1.2/data/Sandbox
tar cvzf $mydir/SolutionExtensions.tgz SolutionExtensions*
popd
