#!/bin/bash

# Send ^C to kill screen sessions

echo "Stopping OMG Watcher..."
while screen -S omg_watcher -X at 0 stuff ^C; do :; done

echo "Stopping OMG Child Chain..."
while screen -S omg_child_chain -X at 0 stuff ^C; do :; done

echo "Stopping OMG Root Chain..."
while screen -S omg_root_chain -X at 0 stuff ^C; do :; done

echo "OMG Components Stopped..."
