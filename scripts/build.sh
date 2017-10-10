#!/usr/bin/env bash

set -e

export PATH=node_modules/.bin:${PATH}

rm -rf public/
rm -rf static/build

mkdir -p static/build

cp -r static/src/img static/build

hugo -v
