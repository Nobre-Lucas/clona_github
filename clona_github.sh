#!/bin/bash

mkdir -P meus-repositorios-git
cd meus-repositorios-git

printf "\n\nBuscando URLs dos projetos...i\n\n"

repositorios=$(curl -s https://api.github.com/users/nobre-lucas/repos | awk '/clone_url/{print $2}' | sed 's/^"//g' | sed 's/",$//g')

for repositorio in $repositorios
do
	git clone $repositorio
done
