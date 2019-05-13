#!/bin/sh

#up-to-date
git pull

#make all
for d in ./2*/ ; do (cd "$d" && make publish); done

#move to p2psp.github.io
target=~/P2PSP.github.io/slides/
rm -r $target
mkdir $target
cp -r *-*-* $target
cp style.css $target
cp -r images $target
php index.php >> ${target}index.html
