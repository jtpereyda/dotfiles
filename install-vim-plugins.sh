#!/bin/bash
# clone some vim plugins
mkdir -p ~/.vim/autoload ~/.vim/bundle

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/ntpeters/vim-better-whitespace.git ~/.vim/bundle/vim-better-whitespace
git clone https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/vim-pandoc/vim-pandoc.git ~/.vim/bundle/vim-pandoc
git clone https://github.com/vim-pandoc/vim-pandoc-syntax.git ~/.vim/bundle/vim-pandoc-syntax

git -C ~/.vim/bundle/vim-better-whitespace pull
git -C ~/.vim/bundle/vim-pandoc pull
git -C ~/.vim/bundle/vim-pandoc-syntax pull
git -C ~/.vim/bundle/syntastic pull
