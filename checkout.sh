#!/bin/sh 
set -e

ROOT_DIR=`pwd`
GOPATH=`pwd`/gopath



dep_ensure_nbcapid() {
    cd $GOPATH/src/gitlab.com/tenbayblockchain/nbcapid
    dep ensure 
}

clone_nbcapid() {
    local opt=$1
    cd $ROOT_DIR
    test -d $GOPATH/src/gitlab.com/tenbayblockchain/nbcapid || {
        cd $GOPATH
        git clone https://gitlab.com/tenbayblockchain/nbcapid.git src/gitlab.com/tenbayblockchain/nbcapid
        test "$opt" = "-n" &&  return
        dep_ensure_nbcapid
    }
}

pull_nbcapid() {
    local opt=$1
    cd $ROOT_DIR
    test -d $GOPATH/src/gitlab.com/tenbayblockchain/nbcapid && {
        cd $GOPATH/src/gitlab.com/tenbayblockchain/nbcapid
        git pull 
        test "$opt" = "-n" &&  return
        dep_ensure_nbcapid
    }
}

##########################################################################################

dep_ensure_gosdksrvd() {
    cd $GOPATH/src/gitlab.com/tenbayblockchain/gosdksrvd
    dep ensure 
}

clone_gosdksrvd() {
    local opt=$1
    cd $ROOT_DIR
    test -d $GOPATH/src/gitlab.com/tenbayblockchain/gosdksrvd || {
        cd $GOPATH
        git clone https://gitlab.com/tenbayblockchain/gosdksrvd.git src/gitlab.com/tenbayblockchain/gosdksrvd
        test "$opt" = "-n" &&  return
        dep_ensure_gosdksrvd
    }
}

pull_gosdksrvd() {
    local opt=$1
    echo $opt 
    cd $ROOT_DIR
    test -d $GOPATH/src/gitlab.com/tenbayblockchain/gosdksrvd && {
        cd $GOPATH/src/gitlab.com/tenbayblockchain/gosdksrvd
        git pull 
        test "$opt" = "-n" &&  return
        dep_ensure_gosdksrvd
    }
}
##########################################################################################

EXPLOERE_DIR=$GOPATH/src/github.com/helloshiki/blockchain-explorer
npm_install_explorer() {
    cd $EXPLOERE_DIR
    npm install 
    cd client 
    npm install 
}

clone_explorer() {
    local opt=$1
    cd $ROOT_DIR
    test -d $EXPLOERE_DIR || {
        cd $GOPATH
        git clone https://github.com/helloshiki/blockchain-explorer.git src/github.com/helloshiki/blockchain-explorer
        test "$opt" = "-n" &&  return
        npm_install_explorer
    }
}

pull_explorer() {
    local opt=$1
    echo $opt 
    cd $ROOT_DIR
    test -d $EXPLOERE_DIR && {
        cd $EXPLOERE_DIR
        git pull 
        test "$opt" = "-n" &&  return
        npm_install_explorer
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
    pull_nbcapid $2
    pull_gosdksrvd $2
    ;;
clone_nbcapid)
    clone_nbcapid ;;
clone_gosdksrvd)
    clone_gosdksrvd ;;
pull_nbcapid)
    pull_nbcapid ;;
pull_gosdksrvd)
    pull_gosdksrvd ;;   
pull_explorer)
    pull_explorer $2;;        
clone_explorer)
    clone_explorer $2;;    
*)
    echo "$0 clone|pull|clone_nbcapid|clone_gosdksrvd|pull_nbcapid|pull_gosdksrvd"
esac
