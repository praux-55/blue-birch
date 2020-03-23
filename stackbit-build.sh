#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e6e9b18790ee2001906dacc/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e6e9b18790ee2001906dacc
curl -s -X POST https://api.stackbit.com/project/5e6e9b18790ee2001906dacc/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e6e9b18790ee2001906dacc/webhook/build/publish > /dev/null
