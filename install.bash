#!/bin/bash

TOOLS=(
	stopwatch
	timer
)

for tool in "${TOOLS[@]}"; do
    sudo cp "./bin/$tool" /usr/local/bin/
done

echo "Done"
