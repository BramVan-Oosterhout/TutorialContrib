#!/bin/bash
# Prepare the assets directory
mydir=`pwd`
pushd ~/devfoswiki/core/data/Applications
tar --owner nginx --group nginx -cvzf $mydir/NotePadApp.tgz  NotePadApp/*
tar --owner nginx --group nginx -cvzf $mydir/SolNotePadApp.tgz --exclude Web* SolNotePadApp/*
popd
pushd ~/devfoswiki/core/data/Sandbox
tar --owner nginx --group nginx -cvzf $mydir/SolNotePad.tgz SolNotePad/*
popd
