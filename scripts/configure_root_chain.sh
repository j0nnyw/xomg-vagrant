#!/bin/bash

cd ~
source DEV/bin/activate
cd ~/elixir-omg

# Compile Contracts

mix clean
mix deps.get
mix deps.compile plasma_contracts

# Configure Root Chain Contract

mix compile
mix run --no-start -e \
 '
   contents = OMG.Eth.DevHelpers.prepare_env!() |> OMG.Eth.DevHelpers.create_conf_file()
   "~/config.exs" |> Path.expand() |> File.write!(contents)
 '

AUTH_ADDR=$(cat ~/config.exs | grep -oP "authority_addr: \K\"(.*)\"")

JS="personal.unlockAccount("$AUTH_ADDR", \"ThisIsATestnetPassphrase\", 0)"

geth attach http://127.0.0.1:8545 --exec "`echo $JS`"
