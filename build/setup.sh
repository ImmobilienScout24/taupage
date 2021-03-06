#!/bin/bash


export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# apt defaults
export DEBIAN_FRONTEND=noninteractive

# start installation
set -x

cd $(dirname $0)
export BUILD_DIR=$(pwd)
for script in $(ls -p setup.d | grep -v / | sort); do
    cd $BUILD_DIR
    . setup.d/$script
done
