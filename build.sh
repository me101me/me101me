#!/bin/sh
set -e
if [ -z "$1" ]; then
	echo "platform required" >&2
	exit 1
fi
if [ -z "$2" ]; then
	echo "extension required" >&2
	exit 1
fi

APPNAME=me101me
APPVERSION=`node parsejson.js version < app/package.json`
JSONURL="http://nwjs.io/versions.json"
NWVERSION=`curl $JSONURL | node parsejson.js stable`
PLATFORM="$1";
# "win-x64", "win-ia32", "linux-x64", "linux-ia32", "osx-x64"
EXT="$2"
# ".tar.gz", ".zip"
NWFNP="nwjs-$NWVERSION-$PLATFORM"
NWFN="$NWFNP$EXT"
OUTDIR="$APPNAME-$APPVERSION-$PLATFORM"
echo "$NWFN" >&2
THISDIR="$(cd "$(dirname "$0")" && pwd -P)"
CACHEDIR="$THISDIR/cache"
mkdir -p "$CACHEDIR"
if [ ! -f "$CACHEDIR/$NWFN" ]; then
	DLURL="http://dl.nwjs.io/$NWVERSION/$NWFN"
	curl "$DLURL" > "$CACHEDIR/$NWFN"
else
	echo "Reuse cache $CACHEDIR/$NWFN" >&2
fi
rm -rf "out/$OUTDIR"
mkdir -p "out/$OUTDIR"
cd "out/$OUTDIR"
if [ "$EXT" = ".zip" ]; then
	unzip "$CACHEDIR/$NWFN"
else
	tar -xzf "$CACHEDIR/$NWFN"
fi
mv "$NWFNP" "nwjs"
cp -r "$THISDIR/app" .
cp -r "$THISDIR/bin" .
cp "$THISDIR/LICENSE" app/LICENSE
cd "$THISDIR"
cd "out"
if [ "$EXT" = ".zip" ]; then
	zip -r "$OUTDIR.zip" "$OUTDIR"
else
	tar -czf "$OUTDIR.tar.gz" "$OUTDIR"
fi
