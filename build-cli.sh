#!/bin/bash

ARTIFACT_VERSION=$(python -c 'from convoy import __version__; print(__version__)')
ARTIFACT_CLI="batch-shipyard-${ARTIFACT_VERSION}-cli-linux-x86_64"
ARTIFACT_CLI_PATH="dist/$ARTIFACT_CLI"

pyinstaller -F -n ${ARTIFACT_CLI} -p batch-shipyard \
    --add-data federation/docker-compose.yml:federation --add-data heimdall:heimdall --add-data schemas:schemas --add-data scripts:scripts \
    --exclude-module future.tests --exclude-module future.backports.test --exclude-module future.moves.test \
    --distpath dist \
    --clean \
    shipyard.py

chmod +x ${ARTIFACT_CLI_PATH}
sha256sum ${ARTIFACT_CLI_PATH} | cut -d' ' -f1 > ${ARTIFACT_CLI_PATH}.sha256
