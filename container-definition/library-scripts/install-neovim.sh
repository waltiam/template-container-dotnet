#!/usr/bin/env bash
# Ensure apt is in non-interactive to avoid prompts
export DEBIAN_FRONTEND=noninteractive

# install pre-reqs
apt-get -y update
apt-get -y install \
    ninja-build \
    gettext \
    libtool \
    libtool-bin \
    autoconf \
    automake \
    cmake \
    g++ \
    pkg-config \
    unzip

# install neovim
pushd /tmp/library-scripts/
git clone https://github.com/neovim/neovim.git

pushd ./neovim
make CMAKE_BUILD_TYPE=Release
make install
popd

# install dein - neovim package manager
mkdir -p ~/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh

# For example, we just use `~/.cache/dein` as installation directory
sh ./installer.sh ~/.cache/dein
# copy the vim configuration
mkdir -p ~/.config/nvim
cp ./init.vim ~/.config/nvim/

popd