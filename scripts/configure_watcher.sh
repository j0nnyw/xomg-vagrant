#!/bin/bash

cd ~
source DEV/bin/activate

# Always overwrite pre-existing config_watcher.exs
cp ~/config.exs ~/config_watcher.exs

cat >> ~/config_watcher.exs <<-EOF
config :omg_db,
  leveldb_path: Path.join([System.get_env("HOME"), ".omg/data_watcher"])
EOF

cat ~/config_watcher.exs

rm -rf ~/.omg/data_watcher

cd ~/elixir-omg/apps/omg_watcher

yes | mix ecto.reset --no-start

mix run --no-start -e 'OMG.DB.init()' --config ~/config_watcher.exs

screen -S omg_watcher -d -m iex -S mix run --config ~/config_watcher.exs
