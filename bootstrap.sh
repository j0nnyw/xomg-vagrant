# Dependencies
apt-get update
apt-get -y  install build-essential autoconf libtool libgmp3-dev libssl-dev python3-pip htop screen \
            wget software-properties-common git postgresql postgresql-contrib zip unzip libz3-dev

# Erlang and Elixir
echo "Downloading erlang-solutions_1.0_all.deb ..."
wget -q -c https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb
apt-get update
apt-get install -y esl-erlang=1:20.3.6
apt-get -y install elixir=1.6.5-1

## Stop Erlang and Elixir from being upgraded
```
sudo apt-mark hold esl-erlang
sudo apt-mark hold elixir
```

# Geth
add-apt-repository -y ppa:ethereum/ethereum
apt-get update
apt-get -y install geth

# Get appropriate version of solidity compiler
echo "Downloading solidity-ubuntu-trusty.zip ..."
wget -q -c https://github.com/ethereum/solidity/releases/download/v0.4.25/solidity-ubuntu-trusty.zip

unzip solidity-ubuntu-trusty.zip

mv lllc /usr/bin/lllc
mv solc /usr/bin/solc

# Configure PostgreSQL
echo "Configuring PostgreSQL..."
sudo -u postgres createuser omisego_dev
sudo -u postgres psql <<< "ALTER USER omisego_dev WITH ENCRYPTED PASSWORD 'omisego_dev'; ALTER USER omisego_dev CREATEDB;"
