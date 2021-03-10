#!/bin/bash

git remote add upstream https://github.com/cilium/cilium

git fetch upstream
git merge upstream/master
