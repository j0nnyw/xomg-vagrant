#!/bin/bash

cd ~
source DEV/bin/activate

rm -rf ~/.omg/data

cd ~/elixir-omg

mix run --no-start -e 'OMG.DB.init()'

cd ~/elixir-omg/apps/omg_api

screen -S omg_child_chain -d -m iex -S mix run --config ~/config.exs
