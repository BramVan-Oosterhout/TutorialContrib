#!/bin/bash
# Prepare the assets directory
mydir=`pwd`
pushd ~/devfoswiki/core/data/Sandbox/FoswikiTwo3
tar cvzf $mydir/WorkbenchExample.tgz --exclude='Web*' *
popd
