#!/bin/bash

versionName=$(git describe 2> /dev/null)

[ -z "$versionName" ] && echo "0.0.1" || echo $versionName