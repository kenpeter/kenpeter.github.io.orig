#!/bin/sh

git add .
git commit -a -m "Update"

# It use a script to switch ssh private key, have a look at the ~/bin
git kenpeter push
