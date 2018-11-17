#!/bin/bash

# Setup environment variables (required for contract building)
if ! grep -q LC_ALL ~/.bashrc; then
    echo "export LC_ALL=C.UTF-8" >> ~/.bashrc
fi

if ! grep -q LANG ~/.bashrc; then
    echo "export LANG=C.UTF-8" >> ~/.bashrc
fi

source ~/.bashrc

# Setup virtualenv
pip3 install virtualenv
virtualenv DEV
source DEV/bin/activate

# Install Hex and Rebar
mix do local.hex --force, local.rebar --force

# Clone elixir-omg repo
git clone https://github.com/omisego/elixir-omg

# Python dependencies
pip3 install -r elixir-omg/contracts/requirements.txt

# Build!
cd elixir-omg
mix deps.get
