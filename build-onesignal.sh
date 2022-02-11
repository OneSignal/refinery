#!/bin/bash
set -o nounset
# set -o pipefail
set -o xtrace

VERSION="1.10.0"
TAGS="${VERSION}"

unset GOOS
unset GOARCH
export KO_DOCKER_REPO=${KO_DOCKER_REPO:-osig}
export GOFLAGS="-ldflags=-X=main.BuildID=$VERSION"
export SOURCE_DATE_EPOCH=$(date +%s)
# shellcheck disable=SC2086
ko publish \
  --tags "${TAGS}" \
  --base-import-paths \
  --platform "linux/amd64,linux/arm64" \
  ./cmd/refinery
