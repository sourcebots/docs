# SourceBots Documentation

[![CircleCI](https://circleci.com/gh/sourcebots/docs.svg?style=svg)](https://circleci.com/gh/sourcebots/docs)

URL: http://docs.sourcebots.co.uk

## Requirements
- [Hugo](https://gohugo.io) (>=0.30)
- [NodeJS](https://nodejs.org/) (>=6)

## Local Setup
1. `npm install`
2. `git submodule update --init`
3. `./scripts/build.sh`

The site will be output to `public/`.

## Dev server
`./scripts/server.sh` will start a server on http://localhost:1313.

