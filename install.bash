#!/usr/bin/env bash



# Binaries

TOOLS=(
	stopwatch
	timer
)

for tool in "${TOOLS[@]}"; do
    sudo cp "./bin/$tool" /usr/local/bin/
done



# Scripts

SCRIPTS=(
	wayscr
)

sudo pacman -S grim slurp --needed # wayscr dependencies

for tool in "${SCRIPTS[@]}"; do
    sudo cp "./scripts/$tool" /usr/local/bin/
done



echo "Done"
