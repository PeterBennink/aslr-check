#!/bin/bash

for i in `sed 's/:/\n/g' <<< "$PATH"`
do
	find $i -exec file {} \; | grep -i elf | sed 's/:.*$//' | xargs hardening-check >> pie-output
done
