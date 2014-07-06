#!/bin/bash

# This script is designed to zip archive all the directories within a
# given directory (or the current one if unspecified) and output the
# .zips to another directory (or the current one).  Since this uses
# the 'zip' program, it will also update the zips if they already
# exist.
#
# An example use case (what I needed it for in the first place) is to
# zip up all the individual artists in a 'music' folder
#
# For example:
# $ ./zipDirs.sh ~/Music ~/Music-zipped
#
# The output of that command will be all the dirs within ~/Music are
# zipped and placed into ~/Music-zipped
# (e.g. ~/Music/Something -> ~/Music-zipped/Something.zip)
#
# Created by Sean Hickey (Wisellama), 2014
# Released to the Public Domain under the terms of the Unlicense
# http://unlicense.org/
#
# Now lets begin!

startDir=`pwd`

# the directory that contains all the dirs to be zipped up
dirToZip=$1
if [ -z "$dirToZip" ]
then
    dirToZip=.
fi

# the directory where the .zips will be placed
outputDir=$2
if [ -z "$outputDir" ]
then
    outputDir=.
fi

# convert to global paths
if [ ${dirToZip:0:1} != "/" ]
then
    dirToZip=$startDir/$dirToZip
fi
if [ ${outputDir:0:1} != "/" ]
then
    outputDir=$startDir/$outputDir
fi

# Check if they are indeed directories and
# create the output dir if it doesn't exist.
# Side note: I didn't see a good way to negate the '-d' tag, so
# that's why the first if part is a nop (the ':').
# (it didn't like using '!' before it, as in [ ! -d "$dir" ])
if [ -d "$dirToZip" ]
then
    :
else
    echo "$dirToZip is not a directory, quitting."
    exit 2
fi
if [ -d "$outputDir" ]
then
    :
else
    if [ -e "$outputDir" ]
    then 
        echo "$outputDir is not a directory, quitting."
        exit 2
    else 
        mkdir "$outputDir"
    fi
fi

# go to the directory to be zipped up
cd "$dirToZip"

if [ $? -ne 0 ] 
then 
    exit $?
fi

# zip 'em up
# ignore any hidden folders
find . -maxdepth 1 -type d \( ! -iname ".*" \) -exec zip -r "$outputDir/{}.zip" {} \;


# May the Llamas spit upon ye.
