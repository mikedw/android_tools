#!/bin/bash

# This script fetches the latest Git tag, and uprevs accordingly
regex="([0-9]+)\.([0-9]+)\.([0-9]+)"

# Fetch the latest git tag across all branches
$(git fetch --tags 2> errors.txt)
currentTag=$(git for-each-ref refs/tags --sort=-taggerdate --format='%(refname)' --count=1)

# Parse the version numbers
[[ $currentTag =~ $regex ]]
versionMajor=${BASH_REMATCH[1]}
versionMinor=${BASH_REMATCH[2]}

newMinorVersion=$((${versionMinor} + 1))

# Figure out updated version name
versionName=${versionMajor}.${newMinorVersion}.0

[ -z "$currentTag" ] && echo "0.1.0" || echo $versionName