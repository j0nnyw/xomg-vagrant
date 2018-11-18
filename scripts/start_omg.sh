#!/bin/bash

cd "$(dirname "$0")"

bash start_root_chain.sh
bash configure_root_chain.sh
bash start_child_chain.sh
bash configure_watcher.sh
