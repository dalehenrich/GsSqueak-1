#!/bin/sh
set -evx

cd $GS_HOME/shared/repos/tode
git fetch --all
git checkout dev
git pull origin dev
cd $GS_HOME/shared/repos/glass
git fetch --all
git checkout dev
git pull origin dev
cd $GS_HOME/shared/repos
# Link our repo to GemStones repository location
ln ${GS_HOME}/BP2017RH1 ${TRAVIS_BUILD_DIR}
mkdir gs_port && cd gs_port
git clone https://github.com/GsDevKit/ston.git
cd ston
git checkout gs_port
cd $GS_HOME
cp $GS_HOME/shared/repos/BP2017RH1/dhenrich/tODEIntegration/projects/GsSqueak.ston $GS_HOME/sys/local/server/projects
cp $GS_HOME/shared/repos/BP2017RH1/dhenrich/tODEIntegration/sys/local/gsdevkit_bin/* $GS_HOME/sys/local/gsdevkit_bin
