#!/bin/bash

for i in {2..5}; do
   count=0;
   total=0;
   for n in $( awk -v var="$i" -F, '{ print $var }' $@ ); do
      total=$(echo $total+$n | bc )
      ((count++))
   done
   echo "scale=4; $total / $count * 100" | bc
   if [ $i -ne 5 ]; then
      echo " & "
   else
      printf "\n"
   fi
done
