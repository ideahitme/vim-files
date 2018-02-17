# Vim-files

Based on vim-plug

```bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Requires rg for fuzzy term search:

```bash

cargo install ripgrep 
```

Then copy the .vimrc file and do `:PlugInstall` 

## Important commands

```bash
F2 - toggle directory tree
ctrl + / - vertical split
ctrl + shift + f - fuzzy term search
ctrl + p - fuzzy search for files
f m t - rustfmt
ctrl + l - list buffers
gn - next buffer
gp - previous buffer
,ctrl+w - close buffer
ctrl+d - multicursor

:bd - close buffer
ctrl + w -> q - close split



```
