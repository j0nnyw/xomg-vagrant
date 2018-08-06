# Installation via Vagrant
## Prerequisites
* Ensure that [Vagrant](https://www.vagrantup.com/) installed on your local machine

Clone this repository:
```
https://github.com/omisego/omisego-vagrant
```

Run:
```
cd omisego-vagrant
vagrant up --provision
```

Wait a few minutes for all the dependencies to finish installing

SSH into vagrant:
```
vagrant ssh
```

Set ENVs to compile
```
source DEV/bin/activate
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
```

Get the code and pull elixir dependencies
```
git clone https://github.com/omisego/omisego
cd omisego
HEX_HTTP_CONCURRENCY=1 HEX_HTTP_TIMEOUT=120 mix deps.get

compile and test
mix test --no-start
```
