#!/bin/sh

#up-to-date
git pull

#make all
for d in ./2*/ ; do (cd "$d" && make publish); done
