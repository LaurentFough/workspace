#!/bin/bash

source usr/var/color/color

locdir=$(pwd)
listelements=$locdir/* #ne prends que les fichiers visibles

suffixe="$locdir/"


for file in $listelements
do
	if [ "${file}" == "$locdir/install_workspace.sh" ]
	then
		continue
	fi
	if [ "${file}" == "$locdir/vim_vundle" ]
	then
		continue
	fi
	link=${file/$suffixe/"$HOME/."}
	$echo $file
	$echo "   -> $link"
  if [ -r $link ]
  then
    if [ "$1" == "--force" ]
    then
      $echo -e "${orange}   -> écrase ancienne version${neutre}"
      rm $link
      ln -s $file $link
    else
      $echo -e "${rougefonce}   -> déjà présent !${neutre}"
    fi
  else
    $echo -e "${vertfonce}   -> ok !${neutre}"
    ln -s $file $link
  fi
done

cd vim_vundle
./install_vim.sh $1
