#!/bin/sh
# generates plots from sample utility
# plot each variable vs x for each time
# TODO:plot a variable for each time in same plot
cd ${0%/*} || exit 1    # Run from this directory

fileName='BFS_xH_6_UMean_U.xy'
variables=('UMean1' 'UMean2' 'UMean3' 'U1' 'U2' 'U3')
numVariables=6
lineSampleName='monitorSamples1'

tini=40.00000000
tfin=50.00000000
tinc=5.00000000
formato=\"%.8f\"  # para tiempos decimales
#formato=\"%i\"    # para tiempos int
tipoTerminal=0    # 0 window, 1 pdf
OpFlag=1          # 0 Delta Error, 1 Relativo

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "   MONITOR SAMPLES DE CALCULO DE ERROR ENTRE PASO Y PASO DE TIEMPO"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "VERSION 1   VALIDADO EL CALCULO"
echo "            VERSIONES POSTERIORES SOLO MODIFICAN DETALLES DE PLOT"
echo "      Cada columna se considera una variable"
echo
echo "Ejemplo campos vectoriales"
echo
echo "      fileName='nombre_U_UMean.xy'"
echo "      variables=('U1' 'U2' 'U3' 'UMean1' 'UMean2' 'UMean3')"
echo "      numVariables=6"
echo
echo "Ejemplo campos escalares"
echo
echo "      fileName='nombre_p_pMean_k_kMean_Q.xy'"
echo "      variables=('p' 'pMean' 'k' 'kMean' 'Q')"
echo "      numVariables=5"
echo
echo "************************************************************************"
echo
echo "fileName=$fileName"
echo "numVariables=$numVariables"
echo "lineSampleName=$lineSampleName"
echo "tini=$tini"
echo "tfin=$tfin"
echo "tinc=$tinc"
echo 
echo "************************************************************************"

if [ "$OpFlag" -eq 0 ]; then
      echo "OpFlag = 0 - Error entre samples consecutivos"
      echo "      Error = abs(NAct - NOld)"
      echo "Use es caso de problema con el Error Relativo ej: Casos 2D"   
      echo "------------------------------------------------------------------"
      labelFile="ErrorDelta"  
      labelTitle="Error = Abs( NAct - NOld ) "
else
      echo "OpFlag = 1 - Error Relativo entre samples consecutivos"
      echo "      Error = abs( (NAct - NOld)/NAct )"
      echo
      echo "Si se observa el error: \"all points y value undefined!\" use OpFlag=0"
      echo "------------------------------------------------------------------"  
      labelFile="ErrorRel"
      labelTitle="Error Relativo = Abs( (NAct - NOld) / NAct)  "
fi

numTimeSteps=0
for j in $(seq $tini $tinc $tfin)
      do
      numTimeSteps=$((numTimeSteps + 1))
done
numTimeSteps=$((numTimeSteps - 1))

# usar awk e imprimir un resultado
#awk "BEGIN {ec=$tinc+580*$tfin; printf \"%.8f\n\", ec}"
# usar awk y el resultado guardarlo en una variable bash
read tiniMod <<< $(awk "BEGIN{ec=$tini+$tinc; printf $formato, ec}")

h='\'

#numVariables=1
for i in $(seq 1 1 $numVariables)
do
      
      nCol1=$((i+1))
      nCol2=$((nCol1 + numVariables + 1))

      graphName="${variables[i-1]}"

      if [ "$OpFlag" -eq 0 ]; then
            operacion="(abs((\$"$nCol2"-\$"$nCol1")))"
      else
            operacion="(abs((\$"$nCol2"-\$"$nCol1")/(\$"$nCol2"+0.00000000000000000001)))"
      fi
                                  
      echo "set xlabel 'tiempo'" >> gnuplot.in
      echo "set ylabel 'velocidad'" >> gnuplot.in
      echo "set title '$labelTitle$graphName'" >> gnuplot.in
      echo "set mytics 10" >> gnuplot.in2
      echo "set mxtics 10" >> gnuplot.in2
      
      
      echo "set grid" >> gnuplot.in
      if [ "$tipoTerminal" -eq 0 ]; then
            echo "set terminal window $i size 650, 400" >> gnuplot.in
      else
            echo "set terminal pdf color enhanced" >> gnuplot.in
            echo "set output '$labelFile$graphName.pdf'" >> gnuplot.in            
      fi      


      counter=0
      
            rm temporalFile*            
            
            for j in $(seq $tiniMod $tinc $tfin)
            do
               counter=$((counter + 1))
                  
                  
               read timeValueOld <<< $(awk "BEGIN{ec=$j-$tinc; printf $formato, ec}")
                  
                  timeValueAct=$j

                  dirOld="./postProcessing/$lineSampleName/$timeValueOld/"
                  dirAct="./postProcessing/$lineSampleName/$timeValueAct/"

                  pathFileOld="$dirOld$fileName"
                  pathFileAct="$dirAct$fileName"
                  
                  echo "Calculando $timeValueAct - $timeValueOld"

                  paste $pathFileOld $pathFileAct >> temporalFile$j
                  pathFile=temporalFile$j
                  
                  if [ "$counter" -eq 1 ]; then
                        echo "plot \"$pathFile\" using 1:"$operacion" with linespoints ls $counter title \"$timeValueAct\", $h" >> gnuplot.in
                  elif [ "$counter" -eq $numTimeSteps ]; then
                        echo "\"$pathFile\" using 1:"$operacion" with linespoints ls $counter title \"$timeValueAct\"" >> gnuplot.in
                  else
                        echo "\"$pathFile\" using 1:"$operacion" with linespoints ls $counter title \"$timeValueAct\", $h" >> gnuplot.in
                  fi

            done

done

if [ "$tipoTerminal" -eq 0 ]; then
      echo
      echo "      Output en window"
      echo "------------------------------------------------------------------"  
else
      echo "      Output pdf REVISE CARPETA DE CASO"
      echo "------------------------------------------------------------------"  
      echo
fi      

gnuplot gnuplot.in -persist
echo "************************************************************************"
echo "Si aparece un error tipo set REVISAR QUE CON tinc CIERRE EXACTO EN tfin (multiplo)"
echo "Si cannot open file ... Permission denied el archivo esta abierto debe cerrarlo"
echo "************************************************************************"

rm temporalFile*
rm gnuplot.in*