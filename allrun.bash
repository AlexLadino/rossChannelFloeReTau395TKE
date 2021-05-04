#!/bin/sh
cd ${0%/*} || exit 1

. $WM_PROJECT_DIR/bin/tools/RunFunctions

numProc=4
decomposePar

# correr transient
cp -r ./system/controlDict.tke ./system/controlDict # ok
mpiexec -np $numProc pimpleTKEFoamV2021 -parallel