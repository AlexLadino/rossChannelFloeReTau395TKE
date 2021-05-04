#!/bin/sh
# generates plots from sample utility

monitorProbeName='postProcessSample'
probesToPlot="0 1 2 3 4 5"
numProbesToPlot=6
tipoTerminal=0    # 0 window, 1 pdf, 2 svg

# MONITORES ENERALES
#monitorProbeName='intWallShearStress'
#probesToPlot="0"        # Siempre 0
#numProbesToPlot=1
#tipoTerminal=0    # 0 window, 1 pdf, 2 svg
#filesToPlot="0.00000000/surfaceFieldValue.dat"
#variables=('Int Wall Shear')
#espesor=('2')
#numFilesToPlot=1
#numComponents=1
#yRange="[*:*]"
#xRange="[*:*]"

# ------------------------- TURBULENT BUDGET ---------------------------------
# Production UU
#filesToPlot="20.00000000/center_prodResxx.xy 20.00000000/center_prodResMeanxx.xy 20.00000000/center_ProduccionUU.xy 20.00000000/center_ProduccionUU_mean.xy"
#variables=('prodResxx' 'prodResMeanxx' 'ProduccionUU' 'ProduccionUU_mean')
#espesor=('2' '2' '2' '2')
#numFilesToPlot=4
#numComponents=1
#yRange="[*:*]"
#xRange="[*:*]"

# Production UV
#filesToPlot="20.00000000/center_prodResxy.xy 20.00000000/center_prodResMeanxy.xy 20.00000000/center_ProduccionUV.xy 20.00000000/center_ProduccionUV_mean.xy"
#variables=('prodResxy' 'prodResMeanxy' 'ProduccionUV' 'ProduccionUV_mean')
#espesor=('2' '2' '2' '2')
#numFilesToPlot=4
#numComponents=1
#yRange="[*:*]"
#xRange="[*:*]"

# dissipation UU
#filesToPlot="20.00000000/center_dissipationResxx.xy 20.00000000/center_dissipationResMeanxx.xy 20.00000000/center_DisipacionUU.xy 20.00000000/center_DisipacionUU_mean.xy"
#variables=('dissipationResxx' 'dissipationResMeanxx' 'DisipacionUU' 'DisipacionUU_mean')
#espesor=('2' '2' '2' '2')
#numFilesToPlot=4
#numComponents=1
#yRange="[*:*]"
#xRange="[*:*]"


# dissipation UV Resolved
#filesToPlot="20.00000000/center_dissipationResxy.xy 20.00000000/center_DisipacionUV.xy"
#variables=('dissipationResxy' 'DisipacionUV')
#espesor=('2' '2')
#numFilesToPlot=2
#numComponents=1
#yRange="[*:*]"
#xRange="[*:*]"

# dissipation UV Mean
#filesToPlot="20.00000000/center_dissipationResMeanxy.xy 20.00000000/center_DisipacionUV_mean.xy"
#variables=('dissipationResMeanxy' 'DisipacionUV_mean')
#espesor=('2' '2')
#numFilesToPlot=2
#numComponents=1
#yRange="[*:*]"
#xRange="[*:*]"

# TurbulentTransport UV Resolved
#filesToPlot="20.00000000/center_turbTransResxy.xy 20.00000000/center_TurbulentTransportUV.xy"
#variables=('turbTransResxy' 'TurbulentTransportUV')
#espesor=('2' '2')
#numFilesToPlot=2
#numComponents=1
#yRange="[*:*]"
#xRange="[*:*]"

# TurbulentTransport UV Mean
#filesToPlot="20.00000000/center_turbTransResMeanxy.xy 20.00000000/center_TurbulentTransportUV_mean.xy"
#variables=('turbTransResMeanxy' 'TurbulentTransportUV_mean')
#espesor=('2' '2')
#numFilesToPlot=2
#numComponents=1
#yRange="[*:*]"
#xRange="[*:*]"

# TurbulentTransport UU Resolved
#filesToPlot="20.00000000/center_turbTransResxx.xy 20.00000000/center_TurbulentTransportUUfUV.xy"
#variables=('turbTransResxx' 'TurbulentTransportUUfUV')
#espesor=('2' '2')
#numFilesToPlot=2
#numComponents=1
#yRange="[*:*]"
#xRange="[*:*]"

# TurbulentTransport UU Mean
#filesToPlot="20.00000000/center_turbTransResMeanxx.xy 20.00000000/center_TurbulentTransportUUfUV_mean.xy"
#variables=('turbTransResMeanxx' 'TurbulentTransportUUfUV_mean')
#espesor=('2' '2')
#numFilesToPlot=2
#numComponents=1
#yRange="[*:*]"
#xRange="[*:*]"


# TurbulentTransportUU vs TurbulentTransportUUfUV_mean
filesToPlot="20.00000000/center_TurbulentTransportUU.xy 20.00000000/center_TurbulentTransportUUfUV_mean.xy"
variables=('TurbulentTransportUU' 'TurbulentTransportUUfUV_mean')
espesor=('2' '2')
numFilesToPlot=2
numComponents=1
yRange="[*:*]"
xRange="[*:*]"

# ------------------------------------------------------------------------------

# CAMPOS VECTORIALES
#filesToPlot="0.40000000/UMean 0.00000000/UTimeAveraged 0.00000000/RRes"
#variables=('U')
#espesor=('3')
#numFilesToPlot=1
#numComponents=3
#yRange="[-1.1:1.1]"
#xRange="[10:*]"


# CAMPOS TENSORIALES SIMETRICOS
#filesToPlot="0.40000000/UPrime2Mean 0.40000000/RResMean 0.00000000/RTimeAveraged 0.00000000/RRes"
#variables=('UPrime2Mean' 'RResMean' 'RTimeAveraged' 'RRes')
#espesor=('2' '2' '2' '1') 
#numFilesToPlot=4
#numComponents=6   
#yRange="[*:*]"
#xRange="[*:*]"


echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "      MONITOR DE PROBES TRANSITORIOS"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "VERSION 1   VALIDADO EL PLOTEADO"
echo "            VERSIONES POSTERIORES SOLO MODIFICAN DETALLES DE PLOT"
echo 
echo  "Control de operacion"
echo  "Test de combinacion de casos"
echo  "0 1UND / 1 +UND"
echo  "Result     Probes      File        Component   "
echo  "OK         0           0           0           "  
echo  "FALLA      0           0           1           "           
echo  "OK         0           1           1           "
echo  "OK         1           1           1           "
echo  "OK         0           1           0           "
echo  "OK         1           1           0           "
echo  "OK         1           0           0           "
echo  "OK         1           0           1           "
echo
echo "SUMARIO DEL TRANSIENT"
echo
echo  "monitorProbeName = $monitorProbeName           Nombre de carpeta"
echo  "probesToPlot = $probesToPlot                   Desde cero inclusive"
echo  "numProbesToPlot = $numProbesToPlot             Debe ser igual al numero de probesToPlot"
echo  "tipoTerminal = $tipoTerminal                   0 window, 1 pdf, 2 svg"
echo
echo  "filesToPlot = $filesToPlot                     <path>/<nombre>"
echo  "variables = $variables                         1 a 1 con filesToPlot"
echo  "espesor = $espesor                             1 a 1 con filesToPlot espesor de linea"
echo  "numFilesToPlot = $numFilesToPlot               Igual al cantidad de filesToPlot"
echo  "numComponents = $numComponents                 1 escalar, 3 vectorial, 6 tensorial simetrico"
echo  "yRange = $yRange                               Rango en y-axis * es autoscale"
echo  "xRange = $xRange                               Rango en y-axis * es autoscale"
echo
echo "************************************************************************"


h='\'
rm gnuplot.in*
counter=0

numTotalLines=$((numProbesToPlot*numFilesToPlot))

rm gnuplot.in*
      for i in $(seq 1 1 $numComponents)
      do
      
      graphName="Component$i"
      echo "set xlabel 'tiempo'" >> gnuplot.in
      echo "set ylabel 'Variable'" >> gnuplot.in
      echo "set title 'Componente $i'" >> gnuplot.in
      echo "set grid x mx y my" >> gnuplot.in
      echo "set yrange $yRange" >> gnuplot.in
      echo "set xrange $xRange" >> gnuplot.in
                  
      #      echo "set lmargin 5" >> gnuplot.in
      #      echo "set bmargin -10" >> gnuplot.in
      #      echo "set yzeroaxis" >> gnuplot.in
      #      echo "set xzeroaxis" >> gnuplot.in

      #      echo "set ytics 0.2" >> gnuplot.in
      #      echo "set mytics 4" >> gnuplot.in
      #      echo "set xtics 0.1" >> gnuplot.in
      #      echo "set format x \"%2.2f\"" >> gnuplot.in
      #      echo "set mxtics 4" >> gnuplot.in            
            
      if [ "$tipoTerminal" -eq 0 ]; then
            echo "set terminal window $i size 650, 400" >> gnuplot.in
            
      elif [ "$tipoTerminal" -eq 1 ]; then
            echo "set terminal pdf color enhanced" >> gnuplot.in
            echo "set output '$graphName.pdf'" >> gnuplot.in                  
      else
            echo "set terminal svg enhanced size 650, 400" >> gnuplot.in
            echo "set output '$graphName.svg'" >> gnuplot.in            
      fi              
            
      counter=0      
    
      for k in $probesToPlot
      do
           
            nColYIni=$((1 + numComponents*k))
                       
            nColY=$((nColYIni + i))
                                 
            contarVar=0
            for j in $filesToPlot   
            do
                  
                  counter=$((counter + 1))
                                    
                  pathFile="./postProcessing/$monitorProbeName/$j"
                  
#                  echo "probe $k, componente $i, pathfile $pathFile, variable ${variables[contarVar]}"
                  
                  if [ "$counter" -eq 1 ]; then
                  
                        if [ "$numComponents" -eq 1 ]; then
                              echo "plot \"$pathFile\" using 1:$nColY with lines lw ${espesor[contarVar]} title \"Probe $k - ${variables[contarVar]}\", $h" >> gnuplot.in
                        else
                              echo "plot \"< tr '(' ' ' < $pathFile\" using 1:$nColY with lines lw ${espesor[contarVar]} title \"Probe $k - ${variables[contarVar]}\", $h" >> gnuplot.in
                        fi
      
                  elif [ "$counter" -eq $numTotalLines ]; then

                        if [ "$numComponents" -eq 1 ]; then
                              echo "\"$pathFile\" using 1:$nColY with lines lw ${espesor[contarVar]}  title \"Probe $k - ${variables[contarVar]}\"" >> gnuplot.in
                        else
                              echo "\"< tr '(' ' ' < $pathFile\" using 1:$nColY with lines lw ${espesor[contarVar]} title \"Probe $k - ${variables[contarVar]}\"" >> gnuplot.in
                        fi
                        
                  else
                  
                        if [ "$numComponents" -eq 1 ]; then
                              echo entra a una sola componente
                              echo "\"$pathFile\" using 1:$nColY with lines lw ${espesor[contarVar]}  title \"Probe $k - ${variables[contarVar]}\", $h" >> gnuplot.in
                        else
                              echo "\"< tr '(' ' ' < $pathFile\" using 1:$nColY with lines lw ${espesor[contarVar]} title \"Probe $k - ${variables[contarVar]}\", $h" >> gnuplot.in
                        fi
                  fi
                  
                  contarVar=$((contarVar + 1))
                  
            done
            
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

