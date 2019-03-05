#!/usr/bin/env bash

apt update > /dev/null || exit "$?"

# required
apt install git make build-essential ccache zip -y > /dev/null || exit "$?"
# per kernel
apt install curl bc libssl-dev python -y > /dev/null || exit "$?"
