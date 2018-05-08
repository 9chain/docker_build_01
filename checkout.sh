#!/bin/sh 
set -e

ROOT_DIR=`pwd`
GOPATH=`pwd`/gopath



dep_ensure_nbcapid() {
    cd $GOPATH/src/gitlab.com/tenbayblockchain/nbcapid
    dep ensure 
}

clone_nbcapid() {
    cd $ROOT_DIR
    test -d $GOPATH/src/gitlab.com/tenbayblockchain/nbcapid || {
        cd $GOPATH
        git clone https://gitlab.com/tenbayblockchain/nbcapid.git src/gitlab.com/tenbayblockchain/nbcapid
        dep_ensure_nbcapid
    }
}

pull_nbcapid() {
    cd $ROOT_DIR
    test -d $GOPATH/src/gitlab.com/tenbayblockchain/nbcapid && {
        cd $GOPATH/src/gitlab.com/tenbayblockchain/nbcapid
        git pull && dep_ensure_nbcapid
    }
}

##########################################################################################

dep_ensure_gosdksrvd() {
    cd $GOPATH/src/gitlab.com/tenbayblockchain/gosdksrvd
    dep ensure 
}

clone_gosdksrvd() {
    cd $ROOT_DIR
    test -d $GOPATH/src/gitlab.com/tenbayblockchain/gosdksrvd || {
        cd $GOPATH
        git clone https://gitlab.com/tenbayblockchain/gosdksrvd.git src/gitlab.com/tenbayblockchain/gosdksrvd
        dep_ensure_gosdksrvd
    }
}

pull_gosdksrvd() {
    cd $ROOT_DIR
    test -d $GOPATH/src/gitlab.com/tenbayblockchain/gosdksrvd && {
        cd $GOPATH/src/gitlab.com/tenbayblockchain/gosdksrvd
        git pull && dep_ensure_gosdksrvd
    }
}

##########################################################################################
test -e $GOPATH || mkdir -p $GOPATH

case $1 in 
clone)
    clone_nbcapid
    clone_gosdksrvd
    ;;
pull)
    pull_nbcapid
    pull_gosdksrvd
    ;;
clone_nbcapid)
    clone_nbcapid ;;
clone_gosdksrvd)
    clone_gosdksrvd ;;
pull_nbcapid)
    pull_nbcapid ;;
pull_gosdksrvd)
    pull_gosdksrvd ;;           
*)
    echo "$0 clone|pull|clone_nbcapid|clone_gosdksrvd|pull_nbcapid|pull_gosdksrvd"
esac
