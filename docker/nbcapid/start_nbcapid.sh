#!/bin/sh

workdir=/opt/workspace

start_nbcapid() {
    cd $workdir/nbcapid 
    test "$NBCAPID_PORT" = "" && {
        NBCAPID_PORT=8080
    }
    test "$NBCAPID_MODE" = "" && {
        NBCAPID_MODE=release
    }
    test "$NBCAPID_CFG_DIR" = "" && {
        NBCAPID_CFG_DIR="./cfg"
    }
    env | grep NBCAPID
    PORT=$NBCAPID_PORT GIN_MODE=$NBCAPID_MODE NBCAPID_CFG_DIR=$NBCAPID_CFG_DIR  /opt/workspace/nbcapid/nbcapid
}

start_nbcapid