#!/bin/bash

# awk -F, '{ print $1 }' ../*.log | awk -F/ '{ print $NF }' | sort | uniq > ../unique-binaries

# for i in $(cat ../unique-binaries); do
#    grep "/$i," ../*.log > $i
# done

# echo 'done'

rm ../shitty-oss ../good-oss

for i in $(ls -1); do
   amount=$(wc -l < $i);
   zeros=$(awk -F, '{ print $2 }' $i | grep 0 | wc -l)
   ones=$(awk -F, '{ print $2 }' $i | grep 1 | wc -l)
   if (( $amount >= 5 )); then
      if (( $(( amount - ones == 2 )) || $(( amount - ones == 1 )) )); then
         grep "$i,0" $i | awk -F- '{ print $1 }' | awk -F/ '{ print $2 }' >> ../shitty-oss
      fi
   fi
done

for i in $(cat ../shitty-oss| sort | uniq); do
   echo $i
   cat ../shitty-oss | grep $i | wc -l
done
