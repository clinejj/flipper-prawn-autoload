#!/bin/sh
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle check || bundle install

yarn install --check-files --ignore-optional

bin/rails s -b 0.0.0.0
