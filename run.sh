#!/usr/bin/env bash

set -euo pipefail

pushd build
cmake .. && make -j6
popd

echo "Successfully build project to the build/ directory!"