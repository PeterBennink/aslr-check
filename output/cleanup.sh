#!/bin/bash

# sed -i '' 's/Position Independent Executable/PIE/g' *.log
# sed -i '' 's/ PIE: //g' *.log
# sed -i '' 's/Read-only relocations/RELRO/g' *.log
# sed -i '' 's/ RELRO: //g' *.log
# sed -i '' 's/Fortify Source functions/Fortify/g' *.log
# sed -i '' 's/ Fortify: //g' *.log
# sed -i '' 's/ Stack protected: //g' *.log
# sed -i '' 's/ Immediate binding: //g' *.log
sed -i '' 's/no, normal executable!/no/g' *.log
sed -i '' 's/no, not found!/no/g' *.log
sed -i '' 's/no, only unprotected functions found!/no/g' *.log
sed -i '' 's/unknown, no protectable libc functions used/unknown/g' *.log
sed -i '' 's/yes (some protected functions found)/partial/g' *.log
sed -i '' 's/no, regular shared library (ignored)/no/g' *.log

sed -i '' '/.*Fortify.*/d' *.log
sed -i '' 's/.*: yes.*/1/' *.log
sed -i '' 's/.*: no.*/0/' *.log

paste -sd '\n   \n' u18-pie-05-14-2018_13:39:14-clean.log > new.log
sed -i '' 's/://g' *.log
