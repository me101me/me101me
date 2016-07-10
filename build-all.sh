#!/bin/sh
set -e
basedir=`dirname "$0"`
"$basedir/build.sh" "win-x64" ".zip"
"$basedir/build.sh" "win-ia32" ".zip"
"$basedir/build.sh" "linux-x64" ".tar.gz"
"$basedir/build.sh" "linux-ia32" ".tar.gz"
