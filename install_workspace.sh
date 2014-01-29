#!/bin/bash

locdir=$(pwd)
listelements=$locdir/* #ne prends que les fichiers visibles

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
  if [ -r $link ]
  then
    if [ "$1" == "--force" ]
    then
      echo "   -> écrase ancienne version"
      rm $link
      ln -s $file $link
    else
      echo "   -> déjà présent !"
    fi
  else
    echo "   -> ok !"
    ln -s $file $link
  fi
done
