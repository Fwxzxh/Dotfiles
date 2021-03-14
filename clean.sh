#!/bin/env zsh
set -uo pipefail

printf "Running pacman update...\n"
sudo pacman -Syu;

printf "Removing orphans...\\n"
sudo pacman -Rns $(sudo pacman -Qtdq)

sudo pacdiff

printf "Cleaning up pacman cache...\\n"
sudo pacman -Sc
printf "Done\\n\\n"
