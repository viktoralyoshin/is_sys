#!/bin/bash

read -p "Введите старое слово: " wordOld
read -p "Введите новое слово: " wordNew

directory=$(pwd)

touch out.txt

for file in "$directory"/*.txt; do
    if grep -q "$wordOld" "$file"; then
        sed -i "s/$wordOld/$wordNew/g" "$file"
        echo "$file" >> out.txt
    fi
done

printf "Список файлов в out.txt\n"

