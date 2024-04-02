#!/usr/bin/env bash
cp -r .zprofile ~/
cp -r shell ~/.config/ 
cp -r zsh ~/.config/ 
sudo chsh -s /bin/zsh $USER
