sudo apt update --assume-yes && sudo apt upgrade --assume-yes

# dev tools
sudo apt install --assume-yes tmux vim wireshark git

# bc is needed for a workaround in dotfiles/tmux.conf
sudo apt install --assume-yes bc

# clone some vim plugins
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/ntpeters/vim-better-whitespace.git ~/.vim/bundle/vim-better-whitespace
