#!/bin/bash

# Install Erlang and Elixir
wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb
rm erlang-solutions_2.0_all.deb
sudo apt-get update
sudo apt-get install -y esl-erlang
sudo apt-get install -y elixir

# Install Phoenix framework
yes | mix local.hex
yes | mix archive.install hex phx_new

# Start a Postgres container
docker run --name some-postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres

# Install inotify-tools
sudo apt-get install -y inotify-tools
