# Vim-files

Based on vim-plug

```bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Copy the .vimrc file and do `:PlugInstall` 


Requirements:

NeoVim or Vim8

Required plugins:

```bash
sudo apt-get install python3-dev python3-pip exuberant-ctags

# for autocompletion, even if vim8 is used
pip3 install --upgrade neovim

```

Required theme:
```bash
cd $HOME
git clone git@github.com:HenryNewcomer/vim-theme-papaya.git
mkdir -p ~/.vim/colors
mv ~/vim-theme-papaya/papaya.vim ~/.vim/colors
rm -rf ~/vim-theme-papaya
```

## Language support

1. Rust

```bash
export PATH="$PATH:$HOME/.cargo/bin"

rustup component add rustfmt-preview
rustup component add rust-src
cargo install racer
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src" )
```
