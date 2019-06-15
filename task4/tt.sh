#!/bin/sh

directory=$1

if [ -d $directory ]
then
	find $directory -type f -print0 | xargs -0 du | sort -k 1 -nr | head -10
elif [ -help == $directory ]
then
	echo "Command usage:
./tt.sh DIRECTORY"

else
	echo "Invalid option! ./tt.sh DIRECTORY
Please specify directory.
Command usage:
./tt.sh DIRECTORY"
fi

#Все остальные аргументы кроме первого отбросить/пропустить/не вопринимать
while [[ -n $2 ]]
do 
	shift
done 
