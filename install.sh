#!/usr/bin/env bash

#
# Installs the dotfiles
#

function link_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

    if [ -e "${target}" ] && [ ! -L "${target}" ]; then
        mv $target $target.bak
        ln -sf ${source} ${target}
    fi
}

for i in _*
do
    link_file $i
done

# update submodules
git submodule sync
git submodule init
git submodule update
git submodule foreach git pull origin master
git submodule foreach git submodule init
git submodule foreach git submodule update

# setup command-t
cd _vim/bundle/command-t
rake make
