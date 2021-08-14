#!/bin/sh
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bin/rails test

# Run the system tests serially to prevent capybara from starting multiple server instances
PARALLEL_WORKERS=1 bin/rails test:system
