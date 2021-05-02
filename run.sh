#!/usr/bin/env bash

set -euo pipefail

pushd build
cmake .. && make
popd

echo "Successfully build project to the build/ directory!"