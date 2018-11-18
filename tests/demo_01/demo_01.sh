#!/bin/bash

# Submitting transactions and getting a submitted block from the child chain API

cd ~

source DEV/bin/activate

cd ~/elixir-omg

TRANSACTION=`elixir -S mix run --no-start --config ~/config.exs -r ~/tests/demo_01/deposit.exs`

sleep 15

#echo curl "localhost:9656" -d '{"params":{"transaction": "'$TRANSACTION'"}, "method": "submit", "jsonrpc": "2.0","id":0}'

RESULT=`curl -s "localhost:9656" -d '{"params":{"transaction": "'$TRANSACTION'"}, "method": "submit", "jsonrpc": "2.0","id":0}'`

echo $RESULT | python -m json.tool

BLKNUM=`echo $RESULT | grep -oP "blknum\":\K[^}]*"`

#echo $BLKNUM

sleep 15

CHILD_TX_BLOCK=`elixir -S mix run --no-start --config ~/config.exs -e '
    {:ok, _} = Application.ensure_all_started(:ethereumex);
    alias OMG.Eth;
    child_tx_block_number = {:ok, {block_hash, _}} = Eth.RootChain.get_child_chain('$BLKNUM');
    IO.puts( Base.encode16(block_hash) )'`

curl -s "localhost:9656" -d '{"params":{"hash":"'$CHILD_TX_BLOCK'"}, "method":"get_block", "jsonrpc":"2.0", "id":0}' | python -m json.tool
