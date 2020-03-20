!#/bin/bash
# Prepare the assets for the Foswiki Templates scenarios
mydir=`pwd`
pushd ~/foswiki/Foswiki-2.1.2/data/Sandbox
tar cvzf $mydir/SolutionTemplates.tgz SolutionTemplates* MyskinSkinViewTemplate*
popd