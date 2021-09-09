#!/usr/bin/env bash

sudo pacman -Syyu --noconfirm

sudo pacman -S --noconfirm --needed bat \
	neovim \
    git \
    base-devel \
    curl \
	exa \
    ranger \
    htop \
    zsh

chsh -s /bin/zsh

git clone --separate-git-dir=$HOME/.myconf https://github.com/thorbenbelow/dotfiles.git $HOME/myconf-tmp
rm -r ~/myconf-tmp

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +'PlugInstall --sync' +qa

git --git-dir=$HOME/.myconf/ --work-tree=$HOME checkout .
