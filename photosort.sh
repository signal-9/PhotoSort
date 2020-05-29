#!/bin/bash
echo "PhotoRec Recovered Data - Source Folder?"
# Example - /home/user/rootfolderofphotorecdata
read sourcefolder
echo "Destination Folder?"
# Example - /home/user/rootfolderofphotorecdata/SORTED (will be made if doesn't exist)
read destinationfolder
cd $sourcefolder
mkdir $destinationfolder
for extensions in $(find . -type f -name '*.*' | sed 's|.*\.||' | sort -u)
do
mkdir $destinationfolder/$extensions
find $sourcefolder -name \*.$extensions -exec mv {} $destinationfolder/$extensions \;
done
