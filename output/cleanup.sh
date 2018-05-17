#!/bin/bash

sed -i -e 's/Position Independent Executable/PIE/g' *.log
sed -i -e 's/Read-only relocations/RELRO/g' *.log
sed -i -e 's/no, normal executable!/no/g' *.log
sed -i -e 's/no, not found!/no/g' *.log
sed -i -e 's/no, only unprotected functions found!/no/g' *.log
sed -i -e 's/Fortify Source functions/Fortify/g' *.log
sed -i -e 's/unknown, no protectable libc functions used/unknown/g' *.log
sed -i -e 's/yes (some protected functions found)/partial/g' *.log
sed -i -e 's/no, regular shared library (ignored)/no/g' *.log