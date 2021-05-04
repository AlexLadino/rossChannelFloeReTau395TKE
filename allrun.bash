#!/bin/sh
cd ${0%/*} || exit 1

. $WM_PROJECT_DIR/bin/tools/RunFunctions

numProc=6
decomposePar

# correr transient
rm -r ./system # ok
cp -r ./system.tke ./system # ok
cp -r ./constant.tke/* ./constant/
mpiexec -np $numProc pimpleTKEFoamV2021 -parallel