#!/bin/sh
set -o errexit

REPO_ROOT="${REPO_ROOT:-$(dirname "${BASH_SOURCE}")/../..}"
KIND_BIN="${KIND_BIN:-$REPO_ROOT/bin/kind}"

echo ">> exporting kind cluster logs..."
$KIND_BIN export logs --name csi-driver-spiffe _artifacts

echo ">> deleting kind cluster..."
$KIND_BIN delete cluster --name csi-driver-spiffe
