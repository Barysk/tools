#!/bin/sh

set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}Building timer...${NC}"
odin build ./timer.odin -file -target:linux_amd64 -o:speed -out:../bin/timer
echo -e "${GREEN}Done.${NC}"

echo -e "${GREEN}Building stopwatch...${NC}"
odin build ./stopwatch.odin -file -target:linux_amd64 -o:speed -out:../bin/stopwatch
echo -e "${GREEN}Done.${NC}"
