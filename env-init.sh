#!/bin/bash

mkdir repositories

git clone https://github.com/jamestung1990/configs ~/configs
git clone https://github.com/wting/autojump ./repositories/autojump
cd autojump && ./install.py && cd
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

ln -s ./configs/.zshrc .
ln -s ./configs/.shortcuts .
