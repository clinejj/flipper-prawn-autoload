#!/bin/sh
set -e

yarn install --check-files --ignore-optional

bin/webpack-dev-server
