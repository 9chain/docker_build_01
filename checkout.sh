#!/bin/sh 
set -e

ROOT_DIR=`pwd`
download_nbcapid() {
    cd $ROOT_DIR
    test -d nbcapid/src/gitlab.com/tenbayblockchain/nbcapid && return 
    #mkdir nbcapid
    cd nbcapid && git clone https://gitlab.com/tenbayblockchain/nbcapid.git src/gitlab.com/tenbayblockchain/nbcapid
}

download_sdksrvd() {
    cd $ROOT_DIR
    test -d sdksrvd && return 
    mkdir sdksrvd
    cd sdksrvd &&  git clone https://github.com/9chain/sdksrvd.git
}

pull_nbcapid() {
    cd $ROOT_DIR
    test -d nbcapid || exit 1
    cd nbcapid/src/gitlab.com/tenbayblockchain/nbcapid
    git pull 
}

pull_sdksrvd() {
    cd $ROOT_DIR
    test -d nbcapid || exit 1
    cd sdksrvd/sdksrvd  
    git pull 
}

download_nbcapid
download_sdksrvd
pull_nbcapid
pull_sdksrvd