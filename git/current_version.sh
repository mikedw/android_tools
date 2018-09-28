#!/bin/bash

cd ../..

outer_repo=$(git config --get remote.origin.url)

if [ -n "$outer_repo" ]; then
    echo "This tools set is using as a submodule, all git operations would be excuted under the parent project."
    echo -e "Current directory is: \n" $(pwd)
else
    echo -e "Nothing happened... Current directory is: " && cd -
fi;

echo "Current versionName is: "

versionName=$(git describe 2> /dev/null)

[ -z "$versionName" ] && echo "0.0.1" || echo $versionName