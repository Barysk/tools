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
	todoko
	maasu
	lateku
	hosuto
)

sudo pacman -S grim slurp --needed # wayscr dependencies

sudo pacman -S bc --needed # maasu dependencies

for tool in "${SCRIPTS[@]}"; do
    sudo cp "./scripts/$tool" /usr/local/bin/
done



echo "Done"
