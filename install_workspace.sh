#!/bin/bash

locdir=$(pwd)
listelements=$locdir/*

suffixe="$locdir/"


for file in $listelements
do
	if [ "${file}" == "$locdir/install_workspace.sh" ]
	then
		continue
	fi
	link=${file/$suffixe/"$HOME/."}
	echo $file
	echo "   -> $link"
	ln -s $file $link
done
