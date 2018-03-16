#!/bin/bash

versionCode=$(git log -1 --format=%ct)

echo $versionCode