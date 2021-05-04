#!/bin/bash
# generates plots from sample utility
# plot each variable vs x for each time
# TODO:plot a variable for each time in same plot
cd ${0%/*} || exit 1    # Run from this directory

#fileName='center_DisipacionUU_DisipacionUU_mean_dissipationResxx_dissipationResMeanxx.xy'
#variables=('DisipacionUU' 'DisipacionUU_mean' 'dissipationResxx' 'dissipationResMeanxx')

# 'DisipacionUU~=DisipacionUU_mean=dissipationResxx=dissipationResMeanxx'
#fileName='center_DisipacionUU_DisipacionUU_mean_dissipationResxx_dissipationResMeanxx.xy'
#variables=('DisipacionUU' 'DisipacionUU_mean' 'dissipationResxx' 'dissipationResMeanxx')
#numVariables=4

# 'DisipacionUV~=DisipacionUV_mean=dissipationResxy=dissipationResMeanxy'
#fileName='center_DisipacionUV_DisipacionUV_mean_dissipationResxy_dissipationResMeanxy.xy'
#variables=('DisipacionUV' 'DisipacionUV_mean' 'dissipationResxy' 'dissipationResMeanxy')
#numVariables=4

#fileName='center_ProduccionUU_ProduccionUU_mean_prodResxx_prodResMeanxx.xy'
#variables=('ProduccionUU' 'ProduccionUU_mean' 'prodResxx' 'prodResMeanxx')
#numVariables=4

#fileName='center_ProduccionUV_ProduccionUV_mean_prodResxy_prodResMeanxy.xy'
#variables=('ProduccionUV' 'ProduccionUV_mean' 'prodResxy' 'prodResMeanxy')
#numVariables=4

#fileName='center_TurbulentTransportUV_TurbulentTransportUV_mean_turbTransResxy_turbTransResMeanxy.xy'
#variables=('TurbulentTransportUV' 'TurbulentTransportUV_mean' 'turbTransResxy' 'turbTransResMeanxy')
#numVariables=4

#fileName='center_RResMeanxx_RTimeAveragedxx_UPrime2Meanxx.xy'
#variables=('RResMeanxx' 'RTimeAveragedxx' 'UPrime2Meanxx')
#numVariables=3

#fileName='center_RResxy_RResMeanxy_RTimeAveragedxy_UPrime2Meanxy.xy'
#variables=('RResxy' 'RResMeanxy' 'RTimeAveragedxy' 'UPrime2Meanxy')
#numVariables=4


#fileName='center_RResxx_RResMeanxx_RTimeAveragedxx_UPrime2Meanxx.xy'
#variables=('RResxx' 'RResMeanxx' 'RTimeAveragedxx' 'UPrime2Meanxx')
#numVariables=4

#fileName='center_UPrime2Mean.xy'
fileName='center_RMean.xy'
variables=('UPrime2Meanxx' 'UPrime2Meanxy' 'UPrime2Meanxz' 'UPrime2Meanyy' 'UPrime2Meanyz' 'UPrime2Meanzz')
numVariables=6

#fileName='center_prodResMeanxx_prodResMeanxy_prodResMeanxz_prodResMeanyy_prodResMeanyz_prodResMeanzz.xy'
#variables=('prodResMeanxx' 'prodResMeanxy' 'prodResMeanxz' 'prodResMeanyy' 'prodResMeanyz' 'prodResMeanzz')
#numVariables=6

lineSampleName='postProcessSample'

tini=6200.00000000
tfin=6280.00000000
tinc=40.00000000
formato=\"%.8f\"  # para tiempos decimales
#formato=\"%i\"    # para tiempos int
tipoTerminal=0    # 0 window, 1 pdf

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "      MONITOR DE SAMPLES"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "VERSION 1   VALIDADO EL PLOTEADO"
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

numTimeSteps=0

for j in $(seq $tini $tinc $tfin)
      do
      numTimeSteps=$((numTimeSteps + 1))
done

h='\'

for i in $(seq 1 1 $numVariables)
do
      k=$((i + 1))          
      colY=$k

      graphName="${variables[i-1]}.pdf"
                                  
      echo "set xlabel 'tiempo'" >> gnuplot.in
      echo "set ylabel 'velocidad'" >> gnuplot.in
      echo "set title '$graphName'" >> gnuplot.in
      echo "set grid x mx y my" >> gnuplot.in
      
#         echo "set lmargin 5" >> gnuplot.in
#         echo "set bmargin -10" >> gnuplot.in
         echo "set yzeroaxis" >> gnuplot.in
         echo "set xzeroaxis" >> gnuplot.in
         
#         echo "set ytics 0.2" >> gnuplot.in
#         echo "set mytics 10" >> gnuplot.in
#         echo "set xtics 0.1" >> gnuplot.in
#         echo "set format x \"%2.2f\"" >> gnuplot.in
#         echo "set mxtics 4" >> gnuplot.in

#         echo "set y2tics 0.2" >> gnuplot.in
#         echo "set my2tics 4" >> gnuplot.in
#         echo "set x2tics 0.1" >> gnuplot.in
#         echo "set format x2 \"%2.2f\"" >> gnuplot.in
#         echo "set mx2tics 4" >> gnuplot.in
              
#       echo "set style line 100 lt 1 lc rgb \"gray\" lw 2" >> gnuplot.in
#       echo  "set style line 101 lt 0.5 lc rgb \"gray\" lw 1 " >> gnuplot.in

#       echo  "set grid mytics ytics ls 100, ls 101 " >> gnuplot.in
#       echo  "set grid mxtics xtics ls 100, ls 101 " >> gnuplot.in

      if [ "$tipoTerminal" -eq 0 ]; then
            echo "set terminal window $i size 650, 400" >> gnuplot.in
      else
            echo "set terminal pdf color enhanced" >> gnuplot.in
            echo "set output '$graphName'" >> gnuplot.in            
      fi      

      counter=0
            
#            echo Procesando ${variables[i-1]}
            
            for j in $(seq $tini $tinc $tfin)
            do
                  counter=$((counter + 1))

                  # echo "$counter"
                  timeValue=$j
                  echo Procesando $timeValue
                  dirLog="./postProcessing/$lineSampleName/$timeValue/"
                  pathFile="$dirLog$fileName"

                  if [ "$counter" -eq 1 ]; then
                        echo "plot \"$pathFile\" using 1:$colY with linespoints ls $counter title \"$timeValue\", $h" >> gnuplot.in
#                        echo "plot \"$pathFile\" using 1:$colY with linespoints ls $counter title \"$timeValue\", $h"
                  elif [ "$counter" -eq $numTimeSteps ]; then
                        echo "\"$pathFile\" using 1:$colY with linespoints ls $counter title \"$timeValue\"" >> gnuplot.in
#                        echo "\"$pathFile\" using 1:$colY with linespoints ls $counter title \"$timeValue\""
                  else
                        echo "\"$pathFile\" using 1:$colY with linespoints ls $counter title \"$timeValue\", $h" >> gnuplot.in
#                        echo "\"$pathFile\" using 1:$colY with linespoints ls $counter title \"$timeValue\", $h"
                  fi

            done

done

if [ "$tipoTerminal" -eq 0 ]; then
      echo "------------------------------------------------------------------" 
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

rm gnuplot.in*
