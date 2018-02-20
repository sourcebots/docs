#!/usr/bin/env bash

set -e

export PATH=node_modules/.bin:${PATH}

rm -rf public/
rm -rf content/tutorials/kit-assembly.files
cp -r static/img/assembly content/tutorials/kit-assembly.files

hugo -v --gc
