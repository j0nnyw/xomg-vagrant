#!/bin/bash

screen -S omg_root_chain -d -m geth --dev --dev.period 1 --rpc --rpcapi personal,web3,eth,net --rpcaddr 0.0.0.0
