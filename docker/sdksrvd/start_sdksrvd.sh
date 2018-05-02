#!/bin/sh

workdir=/opt/workspace

start_sdksrvd() {
    cd $workdir/sdksrvd
    mkdir -p logs
    echo `uptime` "start sdksrvd"
    node main.js 
}

start_sdksrvd
