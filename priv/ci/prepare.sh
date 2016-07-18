#!/bin/bash
# ensure exit codes other than 0 fail the build
set -e

# asdf
# -- install if not installed before
# -- add plugins if not added before
function asdfPlugin {
  asdf plugin-add $1 https://github.com/HashNuke/asdf-$1.git
}

if ! asdf | grep version; then git clone https://github.com/HashNuke/asdf.git ~/.asdf; fi
if ! asdf plugin-list | grep erlang; then $(asdfPlugin "erlang"); fi
if ! asdf plugin-list | grep elixir; then $(asdfPlugin "elixir"); fi

# install erlang & elixir
asdf install

# get dependencies
if [ ! -e $HOME/.mix/rebar ]; then
  yes | mix local.rebar
fi

yes | mix deps.get

# exit successfully
exit 0
