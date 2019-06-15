#!/bin/sh

touch tmpfile
cat $1 | sed 's/(.*)/:/g'>tmpfile

while IFS=":" read name comment ; do
#форматирование переменной name, lowercase и замена " " на "_"
name=$(echo $name | sed 's/.*/\L&/g' | sed 's/ \{1,\}/_/g')
#	echo $name $comment
	userdel -f -r -Z $name
	groupdel $name
done<./tmpfile
rm -rf tmpfile
