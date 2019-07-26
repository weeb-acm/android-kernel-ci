#!/usr/bin/env bash

echo "Installing required packages ..."

apt update > /dev/null || exit "$?"

# required
apt install git make build-essential ccache curl zip -y > /dev/null || exit "$?"
# per kernel
apt install bc libssl-dev python -y > /dev/null || exit "$?"

echo "Syncing required repositories ..."

mkdir -p "data"

PIDS=""
./sync.sh https://github.com/weeb-acm/weebmsm8998-pie.git "data/kernel" "pie" &
PIDS="${PIDS} $!"
./sync.sh https://github.com/kdrag0n/aarch64-elf-gcc "data/gcc" &
PIDS="${PIDS} $!"
./sync.sh https://github.com/kdrag0n/arm-eabi-gcc "data/gcc32" &
PIDS="${PIDS} $!"
./sync.sh https://github.com/weeb-acm/weebanykernel3.git "data/anykernel" "pie" &
PIDS="${PIDS} $!"

for p in $PIDS; do
    wait $p || exit "$?"
done

echo "Done!"
