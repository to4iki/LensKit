#!/usr/bin/env bash

CMD=`basename $0`
DIR=`dirname $0`
SOURCE_DIR=$1
OUTPUT_DIR=$2

if [[ $# -ne 2 ]]; then
    echo "Usage: $CMD <source-dir> <code-generated-dir>" 1>&2
    exit 1
fi

if which sourcery >/dev/null; then
    # Run sourcery
    sourcery --sources "$SOURCE_DIR" --templates "$DIR"/../Templates --output "$OUTPUT_DIR"
else
    echo "Warning: sourcery not installed, download from https://github.com/krzysztofzablocki/Sourcery"
fi
