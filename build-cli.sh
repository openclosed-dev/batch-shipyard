#!/bin/bash

version=$(python -c 'from convoy import __version__; print(__version__)')

ARTIFACT_VERSION=${version} pyinstaller --distpath dist --clean shipyard-cli-linux.spec

for filename in dist/*; do
    chmod +x ${filename}
    sha256sum ${filename} | cut -d' ' -f1 > ${filename}.sha256
done
