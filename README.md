ZipDirs
=======

zipDirs.sh - A bash script to zip archive the directories within a directory.

This script is designed to zip archive all the directories within a
given directory (or the current one if unspecified) and output the
.zips to another directory (or the current one).  Since this uses the
'zip' program, it will also update the zips if they already exist.

An example use case (what I needed it for in the first place) is to
zip up all the individual artists in a 'music' folder.

For example:  
`$ ./zipDirs.sh ~/Music ~/Music-zipped`

The output of that command will be all the dirs within ~/Music are
zipped and placed into ~/Music-zipped  
(e.g. ~/Music/Something -> ~/Music-zipped/Something.zip)

Created by Sean Hickey (Wisellama), 2014  
Released to the Public Domain under the terms of the [Unlicense](http://unlicense.org/)
