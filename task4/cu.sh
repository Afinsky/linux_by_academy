#!/bin/sh
#create user script
#$1 is users_list.txt.

 
#set -x
#set -e

#временный файл для последующего парсинга (без упоминаний о годах)
touch tmpfile
touch userpassword.txt
echo "Username--------Password">userpassword.txt

cat $1 | sed 's/(.*)/:/g'>tmpfile

while IFS=":" read name comment ; do
#форматирование переменной name, lowercase и замена " " на "_"
name=$(echo $name | sed 's/.*/\L&/g' | sed 's/ \{1,\}/_/g')
	useradd -c "$comment" $name
#генерация восьмизнакового пароля
	yourpassword=$(pwgen -s -1)
#кто и какой пароль получил в userpassword.txt	
	echo $name " ---- " $yourpassword>>userpassword.txt
	echo $yourpassword | passwd "$name" --stdin
done<./tmpfile

rm -rf tmpfile
