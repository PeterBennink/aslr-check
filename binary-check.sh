#!/bin/bash

DATE=$(date +%m-%d-%Y_%H:%M:%S)

for i in `sed 's/:/\n/g' <<< "$PATH"`
do
	find $i -exec file {} \; | grep -i elf | sed 's/:.*$//' | xargs hardening-check >> pie-output-$DATE
done
