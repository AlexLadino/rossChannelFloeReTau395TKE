#!/bin/sh
cd ${0%/*} || exit 1

. $WM_PROJECT_DIR/bin/tools/RunFunctions

numProc=4
decomposePar

# correr transient
cp ./system/controlDict.tke ./system/controlDict # ok
cp ./system/userLocationSamples.v2012 ./system/userLocationSamples 
mpiexec -np $numProc pimpleTKEFoamV2021 -parallel