#! /bin/bash

# This script will check all links on the site to see if they are broken.

# Github links below are excluded to prevent breaking the link checker for the Edit in Github urls, when no such page exists in master
blcl --recursive --exclude https://github.com/sourcebots/docs/tree/master/content/* --ordered ./public/
