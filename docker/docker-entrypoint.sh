#!/bin/sh

workdir=`pwd`

start_nbcapid() {
    cd $workdir/nbcapid 
    test "$NBCAPID_PORT" = "" && {
        NBCAPID_PORT=8080
    }
    test "$NBCAPID_MODE" = "" && {
        NBCAPID_MODE=release
    }
    test "$NBCAPID_CFG_PATH" = "" && {
        NBCAPID_CFG_PATH="./cfg"
    }
    
    while :; do
        echo `uptime` "start nbcapid"
        PORT=$NBCAPID_PORT GIN_MODE=$NBCAPID_MODE NBCAPID_CFG_PATH=$NBCAPID_CFG_PATH  ./nbcapid
        sleep 3
    done 
}

start_sdksrvd() {
    cd $workdir/sdksrvd 
    while :; do
        echo `uptime` "start sdksrvd"
        node main.js 
        sleep 3
    done
}

start_nbcapid &
start_sdksrvd &

wait