#!/bin/bash

regex="([0-9]+)\.([0-9]+)\.([0-9]+)"

# Fetch the latest git tag across all branches
$(git fetch --tags 2> /dev/null)
currentTag=$(git for-each-ref refs/tags --sort=-taggerdate --format='%(refname)' --count=1)

# Parse the version numbers
[[ $currentTag =~ $regex ]]
versionMajor=${BASH_REMATCH[1]}

newMajorVersion=$((${versionPatch} + 1))

# Figure out updated version name
versionName=${newMajorVersion}.0.0

[ -z "$currentTag" ] && echo "1.0.0" || echo $versionName