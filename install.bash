#!/usr/bin/env bash
cp -r .zprofile ~/
cp -r shell ~/.config/ 
cp -r zsh ~/.config/ 
mkdir -p ~/.cache/zsh && touch ~/.cache/zsh/history
sudo chsh -s /bin/zsh $USER
