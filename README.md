# Installation via Vagrant

To ease out the process of Installing `elixir-omg` we have set up a simple process utilizing Vagrantfile and a simple bootstrap script

*note: installation by Vagrant will be eventually merged into [Goban](https://github.com/omisego/goban).

## Prerequisites

* Ensure that [Vagrant](https://www.vagrantup.com/) installed on your local machine

## Installation

Clone this repository and run:
```
$ cd xomg-vagrant
$ vagrant up --provision
```

Wait a few minutes for all the dependencies to finish installing

SSH into vagrant:
```
$ vagrant ssh
```

Activate the virtual environment and run the tests to check the installation:
```
[vagrant]$ source DEV/bin/activate
[vagrant]$ cd elixir-omg
[vagrant]$ mix test
```

Continue the [Getting Started guide](https://github.com/omisego/elixir-omg)
